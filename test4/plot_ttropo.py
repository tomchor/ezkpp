from datetime import datetime, timedelta, time
import pandas as pd
from matplotlib import pyplot as plt
import matplotlib.dates as mdates
myFmt = mdates.DateFormatter('%H:%M')
none = mdates.DateFormatter('')

concs = pd.read_csv('ttropo.dat', index_col=0, delim_whitespace=True, header=None, dtype=None).apply(pd.to_numeric, errors='coerce')
concs.columns = ['HNO3','CO', 'OH', 'HO2', 'NO', 'NO2', 'O3']
concs.index.name = 'Hours since noon'
concs.plot(ylim=[1.e4, None], logy=True, y=['O3', 'NO', 'NO2', 'CO', 'HNO3', 'OH', 'HO2'], grid=True)

if True:
    import pickle
    aux = plt.gcf()
    pickle.dump(aux, open('interactive.p', 'w'))

plt.savefig('test4_time.png')
plt.show()



