#include atoms

#DEFVAR
O   = O;    	    { Oxygen atomic ground state }	
O1D = O;	    { Oxygen atomic excited state }
O3  = O + O + O;    { Ozone }
HNO3 = H + N + O+O+O;
H2O2 = H+H + O+O;
CO2  = C + O + O;
CO   = C + O;
OH   = O + H;
HO2  = H + O + O;
H2O2aq = IGNORE;
HNO3aq = IGNORE;

#DEFFIX
M   = O + O + N + N;{ Atmospheric generic molecule }
O2  = O + O;        { Molecular oxygen }
H2O = H + H + O;    { Water }
NO  = N + O;	    { Nitric oxide }	     
NO2 = N + O + O;    { Nitrogen dioxide }
