
import numpy as np
import matplotlib.pyplot as plt

X = [1, 2, 3, 4, 5]
H = [1, -1, 2 ]

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


resultado = convolucion_discreta(X, H)
print("Señal X:", X)
print("Respuesta al impulso H:", H)
print("Resultado de la convolución discreta Y:", resultado)

signal_sin = np.array(1000)
filter_h = np.ones(25)

signal_noise = np.random.rand(1000) * 0.1
signal_sin = np.sin (2 * np.pi * 5 * np.linspace(0, 1, 1000))
signal_x = signal_sin + signal_noise

# Convolución discreta (Filtro mediana)

signal_x_conv = convolucion_discreta(signal_x, filter_h)

signal_x_conv = np.array(signal_x_conv) / len (filter_h)

# Graficas en  matplotlib
    
plt.figure(figsize=(10, 8))
plt.title("Señal senoidal")   
plt.subplot(3, 1, 1)
plt.plot(signal_noise)
plt.title("Señal de ruido")   
plt.subplot(3, 1, 2)
plt.plot(signal_sin)
plt.title("Señal senoidal")
plt.subplot(3, 1, 3)   
plt.plot(signal_x)
plt.title("Señal con ruido") 
plt.tight_layout()

plt.figure(figsize=(10, 8))
plt.title("Señal convolucionada")   
plt.subplot(2, 1, 1)
plt.plot(signal_x)
plt.title("Señal con ruido") 
plt.subplot(2, 1, 2)
plt.plot(signal_x_conv)
plt.title("Señal filtrada") 

plt.tight_layout()

plt.show()    