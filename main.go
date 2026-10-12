package main

import (
	"fmt"
	"os"
)

func main() {
	executable, err := os.Executable()
	if err != nil {
		fmt.Println("Error al obtener la ruta del ejecutable:", err)
		return
	}
	fmt.Printf("Mensaje enviado desde el archivo ejecutable ubicado en: %s\n", executable)
}