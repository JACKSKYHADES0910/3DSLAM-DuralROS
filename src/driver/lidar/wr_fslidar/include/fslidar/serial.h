#ifndef SERIAL_H
#define SERIAL_H

#include  <stdio.h>
#include  <stdlib.h>
#include  <unistd.h>
#include  <sys/types.h>
#include  <sys/signal.h>
#include  <sys/stat.h>
#include  <sys/ioctl.h>
#include  <fcntl.h>
#include  <termios.h>
#include  <errno.h>
#include  <limits.h>
#include  <string.h>

class Serial
{
private:
    int fd;

public:
    Serial();
    bool openUp(const char *dev);
    bool closeOff();
    bool setOption();
    int send(const char *data, int length);
    int recv(char *data, int length);
    bool isOpen();
};

#endif
