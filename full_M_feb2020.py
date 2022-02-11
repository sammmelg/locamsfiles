from astropy.table import Table
from matplotlib import pyplot as plt

t = Table.read('full_M_feb2020.dat', format='ascii.commented_header')
#print(t)

mask = (t['VMag'] < 25.) & (t['VMag'] > 22.)

plt.scatter(t[mask]['dRA/dt'], t[mask]['dDec/dt'])
plt.show()
print(t[mask]['HEclObj_X'])