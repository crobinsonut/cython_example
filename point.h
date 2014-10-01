#ifndef __POINT_H
#define __POINT_H

typedef struct{
    double x;
    double y;
} Point;

Point * point_new(double x, double y);
void point_free(Point * point);
Point * scale(double s, Point * point);

#endif
