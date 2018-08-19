import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="correlade",
    version="0.2.2",
    author="Ian Coleman",
    author_email="colemai@tcd.ie",
    description="Correlation matrix of distance correlation",
    long_description="Pearson correlation only detects linear relationships\
    well, distance correlation is much more flexible. It's more computationally\
    intensive, so this package will randomly select 2000 rows if you feed it more\
    than that. There are other distance correlation computing packages around, \
    this one is just very quick and easy, like Pandas' corr() method ",
    long_description_content_type="text/markdown",
    url="https://github.com/colemai/correlade",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)