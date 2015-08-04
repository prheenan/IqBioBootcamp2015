#!/usr/local/bin/python

import numpy as np

#generate random points around a line and print them to a file

#return a 1 or -1
def randSign():
  if np.random.randint(1): return 1
  return -1

#return a tuple (m, b) for y = mx + b
def equation(n):
  r = []
  for _ in xrange(n+1):
    r.append(randSign()*np.random.rand()*10)
  return r
  #return (randSign()*np.random.rand()*10, randSign()*np.random.rand()*10)

#generate some number of points distributed around a line according to a normal
def genPoints(n, info, mu, std, xRange):
  #(m, b) = info
  info = zip(info, range(len(info)))
  points = []
  xPoints = np.random.uniform(xRange[0], xRange[1], n)
  for x in xPoints:
    #y = (m * x + b) #+ np.random.normal(loc=mu, scale=std)
    y = sum([a*np.power(x, i) for (a, i) in info])
    print(y)
    y = y + np.random.normal(loc=mu, scale=std)
    print(y)
    points.append((x, y))
  return points

n = 3
#(m, b) = equation()
m = equation(n)
#need to be careful with the standard deviation for the error
p = genPoints(100, tuple(m), 0, np.power(10,1.75*n), [-50,50])
with open('random_points_'+str(n)+'.csv', 'w') as Out:
  #Out.write('m: '+str(m)+', b: '+str(b)+'\n')
  Out.write('coefficients: '+str(m)+'\n')
  for (x,y) in p:
    Out.write(str(x)+','+str(y)+'\n')







