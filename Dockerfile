# Etapa 1: Construcción
FROM golang:1.21-alpine AS builder

# Instalar git para clonar el repositorio
RUN apk add --no-cache git

# Intentar clonar desde GitHub, si falla intentar con GitLab, y como último recurso BitBucket
RUN git clone https://github.com/Jonathan-Meixueiro/reto-docker-git.git /codigo-fuente || \
    git clone https://gitlab.com/a240694/reto-docker-git.git /codigo-fuente || \
    git clone https://bitbucket.org/jonamx13/reto-docker-git.git /codigo-fuente

# Establecer el directorio de trabajo donde se descargó el código
WORKDIR /codigo-fuente

# Compilar la aplicación para generar el archivo ejecutable
RUN go build -o app-ejecutable main.go

# Etapa 2: Imagen final
FROM alpine:latest
WORKDIR /app

# Copiar el ejecutable generado en la etapa anterior
COPY --from=builder /codigo-fuente/app-ejecutable .

# Definir el comando de inicio
CMD ["./app-ejecutable"]