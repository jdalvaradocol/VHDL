import numpy as np

# X = [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
# H = [h0,h1,h2,h3,h4,h5,h6,h7,h8,h9]

# x0*h0+x1*h1+x2*h2+x3*h3+x4*h4+x5*h5+x6*h6+x7*h7+x8*h8+x9*h9 
# r0+r1+r2+r3+r4+r5+r6+r7+r8+r9 -- 24 bits

# r0+r1 = S1
# r2+r3 = S2
# r4+r5 = S3 
# r6+r7 = S4
# r8+r9 = S5

# S1+S2 = T1
# S3+S4 = T2

# T1+T2 = Final
# Final + S5 = Salida



#   11111111111111110000
# + 00001111111111111111
# ------------------------


X = [1, 2 ,3 ,4, 5, 6, 7, 8, 9, 10]
H = [0.001, 0.002, 0.003, 0.004, 0.005, 0.006, 0.007, 0.008, 0.009, 0.01]

multiplicacion = np.array(X) * np.array(H)
Salida = np.sum(multiplicacion)
print(Salida)

H = np.array(H) * 1000
multiplicacion = np.array(X) * np.array(H)
Salida = np.sum(multiplicacion)
print(Salida/1000)

coe = 0.12679019877316738 * 100000000000000000000
print(coe) 

acumulador = 0

for i in range (10):
    acumulador = acumulador + H[i]*X[i]

print(acumulador/1000)