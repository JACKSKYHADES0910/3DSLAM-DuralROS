#include <iostream>
#include <unistd.h>
#include "serial.h"

using namespace std;

Serial::Serial()
{
    fd = -1;
}

bool Serial::openUp(const char *dev)
{
    struct termios termios_old;
    fd = open(dev, O_RDWR | O_NOCTTY | O_NDELAY );
    if (fd < 0){
        return false;
    }
    tcgetattr(fd , &termios_old);
    return true;
}

bool Serial::closeOff()
{
    struct termios termios_old;
    if(fd > 0){
        tcsetattr(fd, TCSADRAIN, &termios_old);
        close(fd);
    }
    return true;
}

bool Serial::setOption()
{
    tcflush(fd, TCIOFLUSH);
    int n = fcntl(fd, F_GETFL, 0);
/*
    struct termios termios_old;
    if (tcgetattr(fd, &termios_old) != 0)
    {
        return false;
    }
*/
    struct termios termios_new;
    cfsetispeed(&termios_new, B460800);
    cfsetospeed(&termios_new, B460800);

//    cfsetispeed(&termios_new, B230400);
//    cfsetospeed(&termios_new, B230400);

    termios_new.c_cflag &= ~CSIZE;
    termios_new.c_cflag |= CS8;

    termios_new.c_cflag &= ~PARENB;
    termios_new.c_cflag &= ~CSTOPB;
    termios_new.c_cflag &= ~CRTSCTS;
    //termios_new.c_iflag &= ~(IXON|IXOFF|IXANY);
    termios_new.c_iflag &= ~ISTRIP;
    termios_new.c_iflag |= IGNBRK;

    termios_new.c_cflag |= CLOCAL;
    termios_new.c_cflag |= CREAD;

    termios_new.c_cc[VTIME] = 0;
    termios_new.c_cc[VMIN] = 1;

    termios_new.c_oflag = 0;
    termios_new.c_lflag = 0;

    if (tcsetattr(fd, TCSANOW, &termios_new) != 0)
    {
        return false;
    }

    int mcs = 0;
    ioctl(fd, TIOCMGET, &mcs);
    mcs |= TIOCM_RTS;
    ioctl(fd, TIOCMSET, &mcs);
    return true;
/*
    bzero(&termios_new, sizeof(termios_new));
    cfmakeraw(&termios_new);
    termios_new.c_cflag = B230400;
    termios_new.c_cflag |= CLOCAL | CREAD;
    termios_new.c_cflag &= ~CSIZE;
    termios_new.c_cflag |= CS8;
    termios_new.c_cflag &= ~CSTOPB;
    termios_new.c_cflag &= ~PARENB;

    tcflush(fd, TCIFLUSH);
    tcflush(fd, TCOFLUSH);
    termios_new.c_cc[VTIME] = 1;
    termios_new.c_cc[VMIN] = 1;
    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &termios_new);

    return true;
*/
}

int Serial::send(const char *data, int length)
{
    int len = 0, total_len = 0;
    if(fd <0)
    {
        return -1;
    }

    for (total_len=0;total_len<length;)
    {
        len = write(fd, &data[total_len], length-total_len);
        if (len > 0)
        {
            total_len += len;
        }
        else if(len <= 0)
        {
            len = -1;
            break;
        }
     }
    return len;
}

int Serial::recv(char *data, int length)
{
    //cout << "ok2" << endl;
    if (fd < 0) {
       return -1;
    }
    int len = 0;
    while((len = read(fd, data, length))<=0)
    {
        usleep(1000);
    }
    //printf("%02x ", (unsigned char)*data);
    //printf("read ok: %d, %02x\n", len, (unsigned char)*data);
    return len;
}

bool Serial::isOpen()
{
    return (fd>=0)?true:false;
}
