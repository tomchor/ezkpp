# Runs KPP
kpp $1.kpp
# Uncomments gfortran line on Makefile
sed -i 's/#COMPILER = GFORTRAN/COMPILER = GFORTRAN/g' Makefile_$1
# Compiles
make -f Makefile_$1
# Runs the .exe file
./$1.exe
# Plots
python plot_$1.py
