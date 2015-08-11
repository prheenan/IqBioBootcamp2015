#!/usr/local/bin/python

import numpy as np
import matplotlib.pyplot as plt

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
  t = range(len(info))
  t.reverse()
  info = zip(info, t)
  points = []
  xPoints = np.random.uniform(xRange[0], xRange[1], n)
  for x in xPoints:
    #y = (m * x + b) #+ np.random.normal(loc=mu, scale=std)
    y = sum([a*np.power(x, i) for (a, i) in info])
    print(y)
    if std > 0:
      y = y + np.random.normal(loc=mu, scale=std)
    print(y)
    points.append((x, y))
  return points

#function to generate random points on v/(e^vx) (exponential)
def genExpPoints(n, v, mu, std, xRange):
  points = []
  xPoints = np.random.uniform(xRange[0], xRange[1], n)
  for x in xPoints:
    y = v*np.exp(-1*v*x)
    y = y + np.random.normal(loc=mu, scale=std)
    points.append((x, y))
  return points



#too much randomness can produce curves that exhibit the desired behavior only over large distances... for the cubic, just use a set function
n = 3
#(m, b) = equation()
m = equation(n)
#need to be careful with the standard deviation for the error
#use the cubic x^3-6x^2+4x+12
#m = (1,-6,4,12)
p = genPoints(100, m, 0, np.power(10,1.75*n), [-50,50])
#with open('random_points_'+str(n)+'.csv', 'w') as Out:
#  #Out.write('m: '+str(m)+', b: '+str(b)+'\n')
#  Out.write('coefficients: '+str(m)+'\n')
#  for (x,y) in p:
#    Out.write(str(x)+','+str(y)+'\n')

p = genExpPoints(100, 3, 0, 0.1, [0,5])
#with open('random_points_exp.csv', 'w') as Out:
#  Out.write('Exponential with lambda = 3\n')
#  for (x,y) in p:
#    Out.write(str(x)+','+str(y)+'\n')

#m = [np.random.randint(1,21) for _ in xrange(10)]
#p = genPoints(100, m, 0, 0, [-50,50])

points = np.random.uniform(-10,10,100)
p = [(x,np.sin(x)) for x in points]

with open('random_points_sin.csv', 'w') as Out:
  for (x,y) in p:
    Out.write(str(x)+','+str(y)+'\n')



