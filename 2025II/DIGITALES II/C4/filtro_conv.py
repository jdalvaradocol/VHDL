
import csv
import numpy as np
import matplotlib.pyplot as plt

def convolucion_discreta(x, h):
    """Realiza la convolución discreta entre    x y h."""
    N = len(x)
    M = len(h)
    # Longitud de la señal resultante
    L = N + M - 1
    # Inicializar la señal resultante con ceros
    y = [0] * L
    
    # Realizar la convolución
    for n in range(L):
        for k in range(M):
            if 0 <= n - k < N:
                y[n] += x[n - k] * h[k]
    
    return y

with open("filtro_coe.csv", newline="") as f:
    lector = csv.reader(f)
    datos = [[float(valor) for valor in fila] for fila in lector]

print(datos)


frecuencia  = 1000
fs = 10000  # Frecuencia de muestreo

#signal_sin = np.array(np.linspace(0, 1, fs))
filter_h = np.array(datos)
filter = filter_h.transpose() 

print(filter_h)  

t = np.arange(0, 2, 1/fs)

signal_noise = np.random.rand(len(t)) * 0.0
signal_sin = np.sin (2 * np.pi * frecuencia * t)
signal_x = signal_sin + signal_noise

signal_x_conv = convolucion_discreta(signal_x, filter_h)

plt.figure(figsize=(10, 8))
plt.title("Señal convolucionada")   
plt.subplot(2, 1, 1)
plt.plot(signal_x)
plt.title("Señal con ruido") 
plt.subplot(2, 1, 2)
plt.plot(signal_x_conv)
plt.title("Señal filtrada") 
plt.show()
plt.tight_layout()
