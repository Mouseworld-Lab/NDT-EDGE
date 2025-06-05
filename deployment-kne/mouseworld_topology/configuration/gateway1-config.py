import subprocess

# Comando para agregar la dirección IP en la interfaz ens1
comando_addr_ens1 = "ip addr add 192.168.15.1/24 dev ens1"
subprocess.run(comando_addr_ens1, shell=True)

# Comando para agregar la dirección IP en la interfaz ens2
comando_addr_ens2 = "ip addr add 12.12.12.2/24 dev ens2"
subprocess.run(comando_addr_ens2, shell=True)

# Subredes para ens1
subredes_ens1 = [
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
    "10.0.80.0/24",
    "10.0.81.0/24"
]

# Subredes para ens2
subredes_ens2 = [
    "12.12.12.0/24",
    "192.168.159.0/24",
    # ... (otras subredes para ens2)
]

# Puerta de enlace común para todas las rutas
puerta_enlace_ens1 = "192.168.15.20"
puerta_enlace_ens2 = "12.12.12.1"

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


# Agregar las subredes en ens1
for subred_ens1 in subredes_ens1:
    comando_subred_ens1 = f"ip route add {subred_ens1} via {puerta_enlace_ens1} dev ens1"
    subprocess.run(comando_subred_ens1, shell=True)

# Agregar las subredes en ens2
for subred_ens2 in subredes_ens2:
    comando_subred_ens2 = f"ip route add {subred_ens2} via {puerta_enlace_ens2} dev ens2"
    subprocess.run(comando_subred_ens2, shell=True)
