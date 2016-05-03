#!/bin/bash 
# Nombre: Carmina Herrera
# Script para crear copias de seguridad de la base de datos musicdb 
# Directorio para la creacion de backups
dir="/home/carmi/uasb_DBA/backups/"
# Nombre que se le asignara al backup
nombre=`date +%d-%m-%Y`
# Copia de seguridad mediante pg_dump
pg_dump --username admin_user -h localhost --port 5432 -v --file "$dir/$nombre.backup" "musicdb"
