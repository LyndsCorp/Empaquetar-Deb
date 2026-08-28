#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 CARPETA"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: la carpeta '$1' no existe."
    exit 1
fi

if [ ! -f "$1/DEBIAN/control" ]; then
    echo "Error: '$1' no parece ser una carpeta de paquete Debian."
    echo "Falta: $1/DEBIAN/control"
    exit 1
fi

dpkg-deb --build --root-owner-group "$1"
