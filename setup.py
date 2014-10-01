from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup (
    ext_modules = cythonize([
        Extension("point", ["point.pyx"],
                  include_dirs=['C:\\users\\crrobin3\\cython_example'],
                  libraries=['point'],
                  library_dirs=['c:\\Users\\crrobin3\\cython_example'])])
)
