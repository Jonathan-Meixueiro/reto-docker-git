# Reto Docker y Git

Este proyecto es una pequeña aplicación escrita en Go, desarrollada como parte de las prácticas de la materia Programación de Plataformas Emergentes. La aplicación genera un archivo ejecutable que, al correr, imprime un mensaje en la terminal indicando su ruta de ejecución.

## ⚠️ Requisitos previos
Para que este proyecto funcione, **es obligatorio tener Docker instalado y ejecutándose** en tu computadora. 
* Si usas Windows o Mac, asegúrate de abrir la aplicación **Docker Desktop** y esperar a que el motor indique que está activo (verde) antes de ejecutar los comandos en la terminal.

## ¿Dónde está el archivo ejecutable?
Una duda muy común es: *"Si ya se compiló, ¿por qué no veo el ejecutable en mi carpeta?"*. 
Docker crea entornos virtuales aislados llamados **contenedores**. El archivo ejecutable de Go se descarga, se compila y se guarda **únicamente dentro de la imagen de Docker**, manteniendo tu computadora (host) completamente limpia de archivos innecesarios.

## ¿Cómo funciona la construcción (Dockerfile)?
El proyecto utiliza un proceso en múltiples etapas (multi-stage build) para ser ultra eficiente:
1. Descarga el código fuente directamente desde este repositorio remoto vía HTTPS utilizando Git.
2. Compila el código de Go para generar un archivo binario ejecutable.
3. Copia únicamente el archivo ejecutable a una imagen ligera de Alpine Linux para su ejecución.

## Instrucciones de uso

### 1. Construir la imagen
Para descargar el código desde el repositorio y construir la imagen de Docker, abre tu terminal en la carpeta del proyecto y ejecuta el siguiente comando:

```bash
docker build -t reto-docker-git .
```

### 2. Ejecutar el proyecto
Una vez que la construcción termine con éxito, ejecuta el contenedor para ver el mensaje de la aplicación:

```bash
docker run --rm reto-docker-git
```

**Nota:** el parámetro --rm hace que el ejecutable generado se elimine una vez ejecutado, así nos quitamos la preocupación de tener que borrarlo después de utilizarlo.