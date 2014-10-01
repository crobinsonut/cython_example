cimport cpoint

cdef class Point:
    cdef cpoint.Point * _point

    def __cinit__(self, x, y):
        self._point = cpoint.point_new(x, y)

    def __dealloc__(self):
        cpoint.point_free(self._point)

    def __str__(self):
        return "<x={x}, y={y}>".format(x=self.x, y=self.y)

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

cdef cpoint.Point * c_scale(s, Point point):
    return cpoint.scale(s, point._point)

def scale(s, point):
    cdef cpoint.Point * p = c_scale(s, point)
    return Point(p.x, p.y)
