import pandas as pd

# ETAPA 1: EXTRACCIÓN
# Lee los datos desde un archivo CSV
df = pd.read_csv('data_xd.csv')

# ETAPA 2: TRANSFORMACIÓN
# Ejemplo: elimina filas con valores nulos y convierte una columna a mayúsculas
df = df.dropna()
if 'nombre' in df.columns:
    df['nombre'] = df['nombre'].str.upper()

# ETAPA 3: CARGA
# Guarda el resultado en un 
# 
# nuevo archivo CSV
df.to_csv('data_xd_procesada.csv', index=False)

print("¡Proceso ETL completado!")