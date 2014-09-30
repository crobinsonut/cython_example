from cpoint cimport Point, x2

cdef Point * x2(Point * point):
    cdef Point * new_point = x2(point)

    return new_point

def perturbed(thing):
    return 2