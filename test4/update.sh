kpp ttropo.kpp
sed -i 's/#COMPILER = GFORTRAN/COMPILER = GFORTRAN/g' Makefile_ttropo
make -f Makefile_ttropo
./ttropo.exe
python plot_test4.py
