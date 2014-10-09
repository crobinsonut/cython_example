#ifndef __POINT_H
#define __POINT_H

typedef struct{
    double x;
    double y;
} Point;

void point_free(Point * point);
void scale(double s, Point * point);

#endif
