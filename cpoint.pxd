cdef extern from "point.h":
    ctypedef struct Point:
        double x
        double y

    void point_free(Point * point)
    void scale(double s, Point * point)
