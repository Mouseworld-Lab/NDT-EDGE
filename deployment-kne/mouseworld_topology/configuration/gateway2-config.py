import subprocess

# Definir las rutas a agregar
rutas = [
    "192.168.1.0/24",
    "192.168.2.0/24",
    "192.168.3.0/24",
    "192.168.4.0/24",
    "192.168.5.0/24",
    "192.168.6.0/24",
    "192.168.7.0/24",
    "192.168.8.0/24",
    "192.168.9.0/24",
    "192.168.10.0/24",
    "192.168.11.0/24",
    "192.168.12.0/24",
    "192.168.13.0/24",
    "192.168.14.0/24",
    "192.168.15.0/24",
    "10.0.80.0/24",
    "10.0.81.0/24",
    "13.13.13.0/24",
    "10.0.1.0/24",
    "11.0.2.0/24"
]

# Puerta de enlace y nombre de interfaz comunes para todas las rutas
puerta_enlace = "12.12.12.2"
puerta_enlace_ens2 = "192.168.159.1"
interfaz = "ens1"


#Eliminar y agregar ruta por defecto 
ruta_por_defecto = "default"

# Comando para verificar si la ruta por defecto ya existe
comando_verificar_ruta = f"ip route show | grep {ruta_por_defecto}"

# Ejecutar el comando de verificaci√≥n
resultado = subprocess.run(comando_verificar_ruta, shell=True, stdout=subprocess.PIPE)

# Si la ruta por defecto ya existe, la eliminamos
if resultado.returncode == 0:
    comando_eliminar_ruta = f"ip route del {ruta_por_defecto}"
    subprocess.run(comando_eliminar_ruta, shell=True)

# Agregar la ruta por defecto
comando_ruta_por_defecto = f"ip route add {ruta_por_defecto} via {puerta_enlace_ens2} dev ens2"
subprocess.run(comando_ruta_por_defecto, shell=True)


# Agregar cada ruta utilizando subprocess
for ruta in rutas:
    comando = f"ip route add {ruta} via {puerta_enlace} dev {interfaz}"
    subprocess.run(comando, shell=True)
