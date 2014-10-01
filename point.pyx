cimport cpoint

cdef class Point:
    cdef cpoint.Point * _point

    def __cinit__(self, x, y):
        self._point = cpoint.point_new(x, y)

    def __dealloc__(self):
        cpoint.point_free(self._point)

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

def x2(point):
    return Point(point.x * 2, point.y * 2)
