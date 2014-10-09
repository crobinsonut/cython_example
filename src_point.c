#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "point.h"

void point_free(Point * point){
  if(point != NULL){
        printf("%p", point);
        free(point);
    }
}

void scale(double s, Point * point){
    point->x = point->x * 2;
    point->y = point->y * 2;
}
