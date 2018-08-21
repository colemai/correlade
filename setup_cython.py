from distutils.core import setup
from Cython.Build import cythonize

setup(
	ext_modules = cythonize('correlade/correlade.pyx'),
	name="correlade",
	version="0.2.11",
    author="Ian Coleman",
	)