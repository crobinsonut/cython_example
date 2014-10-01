cdef extern from "point.h":
    ctypedef struct Point:
        double x
        double y

    Point * point_new(double x, double y)
    void point_free(Point * point)
    Point * scale(double s, Point * point)
