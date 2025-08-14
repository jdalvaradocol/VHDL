
with open("salida.txt", "w") as archivo:

    Frecuencia_operacion = 50000000
    Frecuencia_pwm = 500000
    duty_paso =  1 / 100
    duty = Frecuencia_operacion / Frecuencia_pwm 
    pasos = 1 / duty_paso

    for i in range(int(pasos)):
        paso = i * duty_paso
        print('constant DUTY_',int(paso*100),' : integer := ', int(paso*duty),';', sep="")
        print('constant DUTY_',int(paso*100),' : integer := ', int(paso*duty),';', sep="", file=archivo)

