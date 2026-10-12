# Reto Docker y Git

Este proyecto es una pequeña aplicación escrita en Go, desarrollada como parte de las prácticas de la materia. La aplicación simplemente genera un archivo ejecutable que, al correr, imprime un mensaje en la terminal indicando su ruta de ejecución.

## ¿Cómo funciona?
El proyecto utiliza un `Dockerfile` con un proceso de construcción en múltiples etapas (multi-stage build):
1. Descarga el código fuente directamente desde este repositorio remoto vía HTTPS utilizando Git.
2. Compila el código de Go para generar un archivo binario ejecutable.
3. Copia únicamente el archivo ejecutable a una imagen ligera de Alpine Linux para su ejecución.

## Instrucciones de ejecución

### Construir la imagen
Para solicitar el código del repositorio y construir la imagen de Docker, ejecuta el siguiente comando en tu terminal:

```bash
docker build -t reto-docker-git .
```