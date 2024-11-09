#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <ros/ros.h>
//#include <duration.h>

#include "fslidar.h"

using namespace std;

//#define _FAKE
int log_server_sockfd;
int log_client_sockfd;
int portno;

static unsigned char cbit[256] = {
    0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,
    1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,
    1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,
    1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,
    2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
    3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,
    3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,
    4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8,
};

void *logServer(void *argv)
{
    ROS_INFO("log server thread start.");
    socklen_t clilen;
    char buffer[256];
    struct sockaddr_in serv_addr, cli_addr;
    int n;
    log_server_sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (log_server_sockfd < 0)
    {
        ROS_INFO("Alloc socket fd failed.");
        return NULL;
    }
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(12346);
    if (bind(log_server_sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
    {
        ROS_INFO("Listen on port: %d failed.", serv_addr.sin_port);
        return NULL;
    }
    listen(log_server_sockfd, 1);
    clilen = sizeof(cli_addr);
    while(ros::ok())
    {
        log_client_sockfd = accept(log_server_sockfd, (struct sockaddr *) &cli_addr, &clilen);
        ROS_INFO("log server start");
        if (log_client_sockfd < 0)
        {
            ROS_INFO("log server ERROR on accept");
            continue;
        }
        bzero(buffer,256);
        n = read(log_client_sockfd, buffer, 255);
        ROS_INFO("log server stop");
        close(log_client_sockfd);
        log_client_sockfd = -1;
    }
    close(log_server_sockfd);
    ROS_INFO("log server thread stop.");
    return NULL;
}

fslidar::fslidar(int align_cnt)
{
    s_fd = -1;
    ldConst.angle_min = -_M_PI + I_RAD / 16;;
    ldConst.angle_max = _M_PI;
    ldConst.angle_increment = _M_PI * 2 / align_cnt;
    ldConst.range_min = 0.0;
    ldConst.range_max = 40.0;
    ldConst.kDistance = 0.01;
}

fslidar::~fslidar()
{
    if(sPort.isOpen() == true)
    {
#ifndef _FAKE
        turnOff();
        sPort.closeOff();
        //pthread_join(log_server_th, NULL);
#endif
        return;
    }
}

bool fslidar::init(const char *dev)
{
#ifndef _FAKE
    if(sPort.openUp(dev) == false)
    {
        ROS_INFO("Open %s failed!", dev);
        return false;
    }
    if(sPort.setOption() == false)
    {
        ROS_INFO("Set option failed!");
        return false;
    }
    recv_buf = new unsigned char [1024];
    memset((void *)recv_buf, 0, 1024);
    buf_head = recv_buf;
    buf_rear = recv_buf;
    log_server_sockfd = -1;
    log_client_sockfd = -1;
    portno = 12346;
    pthread_create(&log_server_th, NULL, logServer, 0);
#endif
    return true;
}

unsigned char fslidar::crc(unsigned char *buf)
{
    return (cbit[buf[1]]+cbit[buf[2]]+cbit[buf[3]])&0x07;
}

bool fslidar::decode(LaserDataNode *node, unsigned char *buf)
{
    unsigned char crcdata = crc(buf);
    unsigned char crcdata1 = (buf[0]>>4)&0x07;
    if(crcdata1!=  crcdata)

        return false;

    unsigned short ustemp;

    //compute distance
    ustemp= (buf[0]&0x0F);
    ustemp<<= 7;
    ustemp+= (buf[1]&0x7F);
    ustemp<<= 1;
    if( buf[2]&0x40)
        ustemp++;

    node->distance = ustemp;

    ustemp= buf[2]&0x3F;
    ustemp<<= 7;
    ustemp+= (buf[3]&0x7F);
    node->angle = ustemp;

    if(ustemp==5768)
        return true;
    if(ustemp>=5760)
        return false;

    return true;
}

#define _HEX(S) setw(2) << setfill('0') << hex << (int)(unsigned char)(S)
#define _DEC(S) setw(4) << setfill('0') << dec << (S)

int fslidar::getOnePoint(LaserDataNode *ldn, bool print)
{
    //LaserDataNode ldn;
    bool decode_rtn;
    int recv_rtn;
    int ldn_cnt = 0;
    int i;
    stringstream log;
#ifndef _FAKE
    recv_rtn = sPort.recv((char *)buf_rear, 1024);
    if (recv_rtn <= 0)
    {
        ROS_INFO("Receive no data.");
        ros::Duration(0.1).sleep();
        return 0;
    }
    buf_rear += recv_rtn;
    //log << _HEX(buff[3]) << " ";
    while ((buf_rear-buf_head)>=4)
    {
        if ( ((*((int *)buf_head))&0x80808080) != 0x80000000)
        {
            buf_head++;
            continue;
        }
        decode_rtn = decode(ldn, buf_head);
        //log << "decode-> " << _DEC(ldn.angle) << ":" << _DEC(ldn.distance) << " ";
        if(decode_rtn)
        {
            //log << "ok";
            //if(print)
            //    ROS_INFO("%s", log.str().c_str());
            //log << "\n";
            //if(log_client_sockfd != -1)
            //    write(log_client_sockfd,log.str().c_str(), log.str().length());
            ldn++;
            ldn_cnt++;
        }
        //log << "fail";
        //if(print)
        //    ROS_INFO("%s", log.str().c_str());
        //log << "\n";
        //if(log_client_sockfd != -1)
        //    write(log_client_sockfd,log.str().c_str(), log.str().length());
        //log.str("");
        buf_head += 4;
    }
    for(i=0;i<(buf_rear-buf_head);i++)
    {
        recv_buf[i] = buf_head[i];
    }
    buf_head = recv_buf;
    buf_rear = recv_buf + i;
    return ldn_cnt;
#else
    static double i = 0;
    i += 5.76;
    if (i > 5760.0)
    {
        i = 0.0;
    }
    ldn.angle = int(i);
    ldn.distance = 200;
    return ldn;
#endif
}

bool fslidar::turnOn()
{
#ifndef _FAKE
    if (sPort.isOpen()==false)
    {
        return false;
    }
    sPort.send("#SF\r\n", 5);
    sPort.send("#SF\r\n", 5);
#endif
    return true;
}

bool fslidar::turnOff()
{
#ifndef _FAKE
    if (sPort.isOpen()==false)
    {
        return false;
    }
    sPort.send("#SF 0\r\n", 7);
    sPort.send("#SF 0\r\n", 7);
#endif
    return true;
}
