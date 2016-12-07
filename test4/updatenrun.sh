kpp $1.kpp
sed -i 's/#COMPILER = GFORTRAN/COMPILER = GFORTRAN/g' Makefile_$1
make -f Makefile_$1
./$1.exe
python plot_$1.py
