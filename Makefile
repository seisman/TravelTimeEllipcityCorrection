#  path of executables
BIN = .
FC=gfortran
TAUL=libtau.o libsun.o

all: remodlv setbrn ttimes ttimel direct

#  resampling of model
REM = remodl.o
remodlv: remodl.o emtvelin.o $(TAUL)
	$(FC) -o $(BIN)/$@ $^

#  set branches  program
setbrn: setbrn.o $(TAUL)
	$(FC) -o $(BIN)/$@ $^

# travel time branches program
ttimes: ttimes.o $(TAUL)
	$(FC) -o $(BIN)/$@ $^

# ellipticity correction to travel times
ttimel: ttimel.o ellip.o $(TAUL)
	$(FC) -o $(BIN)/$@ $^

# direct access conversion of ellipticity corrections
direct: direct.o
	$(FC) -o $(BIN)/$@ $^

clean:
	rm *.o
