#!/usr/local/bin/python

import numpy as np

#generate random points around a line and print them to a file

#return a 1 or -1
def randSign():
  if np.random.randint(1): return 1
  return -1

#return a tuple (m, b) for y = mx + b
def equation():
  return (randSign()*np.random.rand()*10, randSign()*np.random.rand()*10)

#generate some number of points distributed around a line according to a normal
def genPoints(n, info, mu, std):
  (m, b) = info
  points = []
  xPoints = np.random.uniform(-10, 10, n)
  for x in xPoints:
    y = (m * x + b) #+ np.random.normal(loc=mu, scale=std)
    print(y)
    y = y + np.random.normal(loc=mu, scale=std)
    print(y)
    points.append((x, y))
  return points

(m, b) = equation()
p = genPoints(100, (m, b), 0, 10)
with open('random_points.csv', 'w') as Out:
  Out.write('m: '+str(m)+', b: '+str(b)+'\n')
  for (x,y) in p:
    Out.write(str(x)+','+str(y)+'\n')







