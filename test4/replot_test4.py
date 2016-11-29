from datetime import datetime, timedelta, time
import pandas as pd
from matplotlib import pyplot as plt
import matplotlib.dates as mdates
myFmt = mdates.DateFormatter('%H:%M')
none = mdates.DateFormatter('')

concs = pd.read_csv('ttropo.dat', index_col=0, delim_whitespace=True, header=None, dtype=None).apply(pd.to_numeric, errors='coerce')
concs.columns = ['O3', 'NO2', 'NO', 'CO']
concs.index.name = 'Hours since noon'
concs.plot(ylim=[1.e-8, None], logy=True, y=['O3', 'NO', 'NO2', 'CO'], grid=True)

plt.savefig('test4_time.png')
plt.show()



