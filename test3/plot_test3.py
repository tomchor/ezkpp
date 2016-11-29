from datetime import datetime, timedelta, time
import pandas as pd
from matplotlib import pyplot as plt
import matplotlib.dates as mdates
myFmt = mdates.DateFormatter('%H:%M')
none = mdates.DateFormatter('')

concs = pd.read_csv('strato3.dat', index_col=0, delim_whitespace=True, header=None, dtype=None).apply(pd.to_numeric, errors='coerce')
concs.columns = ['O3', 'NO', 'NO2']
concs.index.name = 'Hours since noon'
concs.plot(ylim=[1.e8, None], logy=True, y=['O3', 'NO', 'NO2'], grid=True)

plt.savefig('test3_time.png')
plt.show()



