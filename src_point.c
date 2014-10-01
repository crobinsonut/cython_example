#include <math.h>
#include <stdlib.h>
#include "point.h"


Point * point_new(double x, double y){
  Point * point = malloc(sizeof(Point));
  point->x = x;
  point->y = y;

  return point;
}

void point_free(Point * point){
  free(point);
}

Point * scale(double s, Point * point){
    return point_new(point->x * s, point->y * s);
}
