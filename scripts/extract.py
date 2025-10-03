import pandas as pd
from sqlalchemy import create_engine

# Ruta al Excel 
excel_file = 'Data_JPC_Proceso.xlsx'

sheets = [
    'Distritos',     
    'Tiendas',      
    'marcas',       
    'categorias',    
    'productos',     
    'precios',       
    'clientes',     
    'empleados',     
    'admin',         
    'ventas',        
    'ventaItems'     
]

# Leer datos
dataframes = {}
try:
    for sheet in sheets:
        df = pd.read_excel(excel_file, sheet_name=sheet)
        df.dropna(inplace=True)  # Elimina filas con valores nulos
        # Manejo de fechas (ajustado para columnas como 'fechaVenta' en ventas)
        date_columns = [col for col in df.columns if 'fecha' in col.lower() or 'creado_en' in col.lower() or 'actualizado_en' in col.lower()]
        for col in date_columns:
            df[col] = pd.to_datetime(df[col], errors='coerce')  # Convierte a datetime, ignora errores
        dataframes[sheet.lower()] = df
    print(f"Hojas leídas exitosamente: {list(dataframes.keys())}")
except Exception as e:
    print(f"Error al leer el Excel: {e}. Verifica los nombres de hojas con pd.ExcelFile(excel_file).sheet_names")
    exit()

# Conectar a PostgreSQL en Render con las credenciales proporcionadas
try:
    engine = create_engine('postgresql://garrita_user:1O5dQbwXyD5jM36Y5NN8cP5yKN2yUlqw@dpg-d31q622dbo4c739r9330-a.oregon-postgres.render.com/garrita?sslmode=require')
    for name, df in dataframes.items():
        df.to_sql(name, engine, schema='staging', if_exists='replace', index=False)
        print(f"Tabla '{name}' cargada a staging en Render.")
    print("Extracción y carga a staging completada exitosamente.")
except Exception as e:
    print(f"Error al cargar a PostgreSQL en Render: {e}. Verifica credenciales, SSL y si el schema 'staging' existe.")