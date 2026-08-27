import tkinter as tk
from tkinter import ttk, messagebox
import serial
import serial.tools.list_ports
import threading
import time

class FPGAControlApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Control I/O FPGA - UART")
        self.root.geometry("480x520")
        self.root.resizable(False, False)

        self.ser = None
        self.read_thread = None
        self.is_running = False

        self.setup_ui()

    def setup_ui(self):
        # --- Configuración Puerto Serie ---
        frame_port = ttk.LabelFrame(self.root, text=" Conexión Serial ")
        frame_port.pack(fill="x", padx=15, pady=10)

        ttk.Label(frame_port, text="Puerto:").grid(row=0, column=0, padx=5, pady=5)
        self.combo_ports = ttk.Combobox(frame_port, values=self.get_ports(), width=12)
        self.combo_ports.grid(row=0, column=1, padx=5, pady=5)
        if self.combo_ports['values']:
            self.combo_ports.current(0)

        self.btn_connect = ttk.Button(frame_port, text="Conectar", command=self.toggle_connection)
        self.btn_connect.grid(row=0, column=2, padx=10, pady=5)

        # --- Control LEDs (PC -> FPGA) ---
        frame_leds = ttk.LabelFrame(self.root, text=" Salida: Control de LEDs (FPGA) ")
        frame_leds.pack(fill="x", padx=15, pady=10)

        self.led_vars = [tk.BooleanVar() for _ in range(8)]
        frame_chk = ttk.Frame(frame_leds)
        frame_chk.pack(pady=5)

        for i in range(8):
            chk = ttk.Checkbutton(frame_chk, text=f"L{7-i}", variable=self.led_vars[7-i], command=self.send_led_states)
            chk.pack(side="left", padx=2)

        frame_manual = ttk.Frame(frame_leds)
        frame_manual.pack(pady=5)
        
        ttk.Label(frame_manual, text="Valor (0-255):").pack(side="left", padx=5)
        self.entry_val = ttk.Entry(frame_manual, width=8)
        self.entry_val.pack(side="left", padx=5)
        self.entry_val.insert(0, "0")

        btn_send = ttk.Button(frame_manual, text="Enviar Dato", command=self.send_manual_val)
        btn_send.pack(side="left", padx=5)

        # --- Lectura Switches (FPGA -> PC) ---
        frame_sw = ttk.LabelFrame(self.root, text=" Entrada: DIP Switches (FPGA) ")
        frame_sw.pack(fill="x", padx=15, pady=10)

        self.canvas_switches = tk.Canvas(frame_sw, height=50)
        self.canvas_switches.pack(fill="x", padx=10, pady=5)
        self.sw_indicators = []
        
        # Dibujar indicadores de switches (8 círculos)
        for i in range(8):
            x = 30 + i * 48
            circle = self.canvas_switches.create_oval(x, 10, x+30, 40, fill="#888888", outline="#333333")
            self.canvas_switches.create_text(x+15, 45, text=f"S{7-i}", font=("Arial", 8))
            self.sw_indicators.append(circle)

        self.lbl_sw_val = ttk.Label(frame_sw, text="Valor Binario: 00000000 | Decimal: 0", font=("Consolas", 10, "bold"))
        self.lbl_sw_val.pack(pady=5)

        # Botón de actualización manual/polling
        btn_read = ttk.Button(frame_sw, text="Leer Switches Ahora", command=self.request_switch_read)
        btn_read.pack(pady=5)

    def get_ports(self):
        ports = serial.tools.list_ports.comports()
        return [p.device for p in ports]

    def toggle_connection(self):
        if self.ser and self.ser.is_open:
            self.is_running = False
            self.ser.close()
            self.btn_connect.config(text="Conectar")
            messagebox.showinfo("UART", "Puerto Desconectado")
        else:
            port = self.combo_ports.get()
            if not port:
                messagebox.showerror("Error", "Selecciona un puerto COM válido.")
                return
            try:
                self.ser = serial.Serial(port, 115200, timeout=1)
                time.sleep(1)
                self.btn_connect.config(text="Desconectar")
                self.is_running = True
                messagebox.showinfo("UART", f"Conectado a {port} a 115200 Baudios")
            except Exception as e:
                messagebox.showerror("Error", f"No se pudo abrir {port}: {e}")

    def send_byte(self, val):
        if self.ser and self.ser.is_open:
            try:
                byte_val = bytes([val & 0xFF])
                self.ser.write(byte_val)
                
                # Leer la respuesta automática (estado de los switches)
                resp = self.ser.read(1)
                if resp:
                    self.update_switches_ui(ord(resp))
            except Exception as e:
                messagebox.showerror("Error TX", f"Fallo al enviar datos: {e}")
        else:
            messagebox.showwarning("Advertencia", "Conéctate al puerto COM primero.")

    def send_led_states(self):
        val = 0
        for i in range(8):
            if self.led_vars[i].get():
                val |= (1 << i)
        self.entry_val.delete(0, tk.END)
        self.entry_val.insert(0, str(val))
        self.send_byte(val)

    def send_manual_val(self):
        try:
            val = int(self.entry_val.get())
            if 0 <= val <= 255:
                for i in range(8):
                    self.led_vars[i].set(bool((val >> i) & 1))
                self.send_byte(val)
            else:
                messagebox.showerror("Error", "Ingresa un número entre 0 y 255.")
        except ValueError:
            messagebox.showerror("Error", "Ingresa un número entero válido.")

    def request_switch_read(self):
        # Re-envía el valor actual de los LEDs para provocar una respuesta con el estado de los switches
        val = int(self.entry_val.get()) if self.entry_val.get().isdigit() else 0
        self.send_byte(val)

    def update_switches_ui(self, val):
        bin_str = f"{val:08b}"
        self.lbl_sw_val.config(text=f"Valor Binario: {bin_str} | Decimal: {val}")
        
        # Actualizar color de los círculos (Verde = ON / Gris = OFF)
        for i in range(8):
            bit = (val >> (7 - i)) & 1
                            
            color = "#00FF00" if bit else "#888888"
            self.canvas_switches.itemconfig(self.sw_indicators[i], fill=color)

if __name__ == "__main__":
    root = tk.Tk()
    app = FPGAControlApp(root)
    root.mainloop()