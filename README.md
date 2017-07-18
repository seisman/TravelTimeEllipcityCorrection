# Calculation of travel times and ellipticity corrections of seismic phases

All the codes are from http://rses.anu.edu.au/seismology/ttsoft.html.

See ellipcor.help, travel.help and ttimel.help for more details.

## Installation

### Compile

    $ make
    $ make clean

### Generate tau tables

This package support two different velocity model:

- iasp91.tvel    (Kennett & Engdahl 1991)
- ak135.tvel     (Kennett, Engdal & Buland 1995)

Use `remodl` to set up tau branches and `setbrn` to organise tables by
travel time branches to allow efficient depth interpolation.

    ./remodl ak135
    ./setbrn
    ./remodl iasp91
    ./setbrn

A set of direct access tables ak135.hed and ak135.tbl are then calculated.

Once the tables have been generated they can be accessed directly by using:

   ttimes

To create the direct access tables for the ellipticity corrections used
by ellip.f and ttimel.f:

    direct < ELCOR.dat

to produce the direct access tables `elcordir.tbl`.

## Usage

### ttimes

    $ ./ttimes
    ak135    # model name
    P        # phase branch
    100      # source depth in km
    20       # epicentral distance in degree

### ttimel

    $ ./ttimel
    ak135    # model name
    P        # phase branch
    50       # source latitude
    100      # source depth in km
    30       # azimuth from source
    20       # epicentral distance in degree
