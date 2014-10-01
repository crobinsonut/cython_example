#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "point.h"

Point * point_new(double x, double y){
  Point * point = malloc(sizeof(Point));
  point->x = x;
  point->y = y;

  return point;
}

void point_free(Point * point){
  if(point != NULL){
        printf("%p", point);
        free(point);
    }
}

Point * scale(double s, Point * point){
    point->x = point->x * 2;
    point->y = point->y * 2;

    return point;
}
