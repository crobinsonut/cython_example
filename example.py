from point import Point, scale

a = Point()
a.x = 1
a.y = 1

print "a after initialization"
print "a{}".format(str(a))

b = a

print "b after assignment"
print "b{}".format(str(b))

b.x = 2

print "a and b after changing x"
print "a{}".format(str(a))
print "b{}".format(str(b))

c = scale(2, b)

print "a, b and c after scaling b"
print "a{}".format(str(a))
print "b{}".format(str(b))
print "c{}".format(str(c))

print "Python references for a, b and c"
print "a{}".format(repr(a))
print "b{}".format(repr(b))
print "c{}".format(repr(c))
