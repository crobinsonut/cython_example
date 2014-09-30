cdef extern from "point.h":
    ctypedef struct Point:
        pass

    Point * point_new(double x, double y)
    void point_free(Point * point)
    Point * x2(Point * point)