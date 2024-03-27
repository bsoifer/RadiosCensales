library(sf)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(plotly)
library(readxl)

View(datos)
radios <- st_read("C:/Users/bruno/Desktop/Primer cuatrimestre 2024/Analítica en Venta Minorista/RADIOS_2010_v2023_1.shp")
datos <- read_xlsx("C:/Users/bruno/Desktop/Primer cuatrimestre 2024/Analítica en Venta Minorista/Indicadores de hogares. Radios, 2010 - Ciudad Autónoma de Buenos Aires (CABA).xlsx")

#Todos los radios censales
ggplot() +
  geom_sf(data = radios)


#Solo CABA
radios_caba <- subset(radios, PROV_ == "02")

ggplot() +
  geom_sf(data = radios_caba)

radios_caba <- left_join(radios_caba, datos, by = c("COD_2010" = "Código de radio"))

#Hogares con computadora
mapa <- ggplot() +
  geom_sf(data = radios_caba, aes(fill = `Hogares con computadora`)) +
  scale_fill_gradient(name = "Hogares con computadora", low = "lightblue", high = "blue") +
  theme_minimal()

print(mapa)

ggplotly(mapa)


