cimport cpoint

cdef class PointManager:
    ref_counter = {}

    cdef cpoint.Point * overwrite(self, cpoint.Point * old, cpoint.Point * new):
        self.free(old)
        return self.share(new)

    cdef cpoint.Point * share(self, cpoint.Point * point):
        if not <long>point in self.ref_counter:
            self.ref_counter[<long>point] = 1

        self.ref_counter[<long>p] += 1

        return point

    cdef cpoint.Point * new(self):
        cdef cpoint.Point * p = cpoint.point_new(0, 0)
        self.ref_counter[<long>p] = 1

        return p

    cdef free(self, cpoint.Point * point):
        self.ref_counter[<long>p] -= 1

        if ref_counter[<long>p] == 0:
            cpoint.point_free(point)
            del self.ref_counter[<long>p]

cdef class Point:
    cdef cpoint.Point * _point
    cdef PointManager pt_mng

    pt_mng = PointManager()

    def __cinit__(self):
        self._point = self.pt_mng.new()

    def __dealloc__(self):
        self.pt_mng.free(self._point)

    def __str__(self):
        return "<x={x}, y={y}>".format(x=self.x, y=self.y)

    @staticmethod
    cdef Point _from_c_point(cpoint.Point * point):

        new_point = Point()
        new_point._point = pt_mng.overwrite(new_point._point, point)

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
    
