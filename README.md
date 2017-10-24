# LDEO Tool kit
Various useful tools and scripts for setting up environments and automating common tasks

## Set up basic xmitgcm environment

simply run,
```
curl -L https://git.io/vdjPq | bash
```
This will install the latest miniconda environment (Version 3.x) and install packages to run xmitgcm.

Here's the list of packages it will install.

```
name: xmitgcm
dependencies:
 - numpy
 - scipy
 - xarray
 - netcdf4
 - dask
 - jupyter
 - matplotlib
 - pip:
   - pytest
   - xmitgcm
```
