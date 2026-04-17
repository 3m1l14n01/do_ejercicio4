import pandas as pd
import datetime

def procesar_datos(input_file, output_file):
    df = pd.read_csv(input_file)

    df["Costo_Total"] = df["Costo_Alojamiento"] + df["Costo_Transporte"]

    resumen = df[["Estado","Temperatura","Humedad","Costo_Total","Dias_Promedio","Tiempo_Traslado"]]

    resumen.to_csv(output_file, index=False)

    with open("backup.log", "a") as log:
        log.write(f"{datetime.datetime.now()} - Procesados {len(df)} registros\n")

if __name__ == "__main__":
    procesar_datos("Estados.txt", "resultado.txt")

