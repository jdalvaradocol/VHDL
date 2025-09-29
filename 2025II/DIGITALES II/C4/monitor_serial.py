import serial
import threading
import time

# Configuración del puerto serial
PORT = 'COM3'        # Ajustar el puerto
BAUD = 9600          # Velocidad en baudios

# Crear conexión serial
ser = serial.Serial(PORT, BAUD, timeout=1)

def leer_serial():
    """Hilo para leer datos del puerto serial en tiempo real."""
    while True:
        if ser.in_waiting > 0:
            dato = ser.readline().decode('utf-8', errors='ignore').strip()
            if dato:
                print(f"\n[RX] {dato}")

def escribir_serial():
    """Enviar datos al puerto serial desde la consola."""
    while True:
        mensaje = input("> ")  # Captura texto desde teclado
        if mensaje.lower() == "exit":
            print("Cerrando monitor...")
            ser.close()
            break
        ser.write((mensaje + "\r\n").encode('utf-8'))

# Lanzar hilo para lectura continua
hilo_lectura = threading.Thread(target=leer_serial, daemon=True)
hilo_lectura.start()

print(f"Monitor Serial iniciado en {PORT} a {BAUD} bps.")
print("Escribe comandos y presiona ENTER. Escribe 'exit' para salir.\n")

# Ejecutar función de envío (bloqueante)
escribir_serial()
