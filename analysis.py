import point as pt
from openmdao.main.api import Assembly, Component
from openmdao.main.datatypes.api import Instance

class Sink(Component):
    point = Instance(pt.Point, iotype='out')

    def execute(self):
        self.point = pt.Point()
        self.point.x = 1.0
        self.point.y = 1.0

class Scale(Component):
    point_in = Instance(pt.Point, iotype='in')
    point_out = Instance(pt.Point, iotype='out')

    def execute(self):
        self.point_out = pt.scale(2.0, self.point_in)

class Unscale(Component):
    point = Instance(pt.Point, iotype='in')

    def execute(self):
        print str(self.point)
        self.point = pt.scale(0.5, self.point)

class Analysis(Assembly):
    def configure(self):
        self.add('sink', Sink())
        self.add('scale', Scale())
        self.add('unscale', Unscale())

        self.connect('sink.point', 'scale.point_in')
        self.connect('scale.point_out', 'unscale.point')

        self.driver.workflow.add(['sink', 'scale', 'unscale'])

if __name__ == "__main__":

    analysis = Analysis()
    analysis.run()
    print str(analysis.sink.point)
    print str(analysis.scale.point_out)
    print str(analysis.unscale.point)
