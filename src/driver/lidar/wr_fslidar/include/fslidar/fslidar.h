#include "serial.h"
#include <pthread.h>

#define _M_PI  (3.1415927)
#define I_RAD ((_M_PI)/180.0)
#define DEG2RAD(x) ((x)*_M_PI/180)

//algi ansys
struct LaserDataNode
{
    unsigned short distance;
    unsigned short angle;
};

struct LidarConstant
{
    double angle_min;
    double angle_max;
    double angle_increment;
    double range_min;
    double range_max;   
    double kDistance;
};

class fslidar 
{
private:
    Serial sPort;
    int s_fd;
    pthread_t log_server_th;
    unsigned char *recv_buf;
    unsigned char *buf_head;
    unsigned char *buf_rear;

    unsigned char crc(unsigned char *buf);

public:
    fslidar(int align_cnt);
    ~fslidar();
    LidarConstant ldConst;
    bool init(const char *dev);
    bool decode(LaserDataNode *node, unsigned char *buf);
    int getOnePoint(LaserDataNode *node, bool print);
    bool turnOn();
    bool turnOff();

};


