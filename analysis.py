import point as pt
from openmdao.main.api import Assembly, Component
from openmdao.main.datatypes.api import Instance

class Scale(Component):
    point = Instance(pt.Point, iotype='in')

    def execute(self):
        self.point = pt.scale(2, self.point)

class Unscale(Component):
    point = Instance(pt.Point, iotype='in')

    def execute(self):
        self.point = pt.scale(0.5, self.point)

class Analysis(Assembly):
    def configure(self):
        self.add('scale', Scale())
        self.add('unscale', Unscale())

        self.connect('scale.point', 'unscale.point')

        self.driver.workflow.add(['scale', 'unscale'])

if __name__ == "__main__":
    analysis = Analysis()
    analysis.scale.point = pt.Point(1, 1)

    print str(analysis.scale.point)

    analysis.run()

    print str(analysis.scale.point)
    print str(analysis.unscale.point)
