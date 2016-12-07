import pandas as pd
from matplotlib import pyplot as plt

concs = pd.read_csv('ttropo.dat', index_col=0, delim_whitespace=True, header=None, dtype=None).apply(pd.to_numeric, errors='coerce')
concs.columns = ['CO2', 'H2O2aq', 'HNO3aq', 'HNO3', 'H2O2', 'CO', 'O1D', 'O', 'OH', 'HO2', 'O3', 'NO', 'NO2', 'M', 'O2', 'H2O']
concs.index.name = 'Hours since noon'
concs.plot(ylim=[1.e4, None], logy=True, y=['O3', 'NO', 'NO2', 'CO', 'HNO3', 'OH', 'HO2'], grid=True)

plt.savefig('test4_time.png', bbox_inches='tight')
plt.show()
