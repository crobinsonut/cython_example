cimport cpoint, cobjwrapper

cdef class Point:
    cdef cpoint.Point * _point

    def __cinit__(self):
        self._point = <cpoint.Point *>cobjwrapper.Alloc(sizeof(cpoint.Point))

    def __dealloc__(self):
        cobjwrapper.Release(<void *>self._point)

    def __str__(self):
        return "<x={x}, y={y}>".format(x=self.x, y=self.y)

    @staticmethod
    cdef Point from_point(Point point):
        p = Point()
        cobjwrapper.Retain(<void *>point._point)
        cobjwrapper.Release(<void *>p._point)
        p._point = point._point

        return p

    property x:
        def __get__(self):
            return self._point.x

        def __set__(self, value):
            self._point.x = value

    property y:
        def __get__(self):
            return self._point.y

        def __set__(self, value):
            self._point.y = value

def scale(double s, Point point):
    cpoint.scale(s, point._point)
    return Point.from_point(point)
