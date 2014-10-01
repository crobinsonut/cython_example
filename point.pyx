cimport cpoint

cdef class Point:
    cdef cpoint.Point * _point
    
    def __cinit__(self):
        self._point = cpoint.point_new(0, 0)

    def __dealloc__(self):
        cpoint.point_free(self._point)

    def __str__(self):
        return "<x={x}, y={y}>".format(x=self.x, y=self.y)

    @staticmethod
    cdef Point _from_c_point(cpoint.Point * point):
        new_point = Point()
        cpoint.point_free(new_point._point)
        new_point._point = point

        return new_point

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
    return Point._from_c_point(cpoint.scale(s, point._point))
    
