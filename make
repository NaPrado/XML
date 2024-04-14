#!/bin/bash

delete(){
	cond1=1
	clear
	rm "$1"
	return 0
}

new(){
	touch "$1"
	chmod 777 "$1"
	echo "<?xml version="1.1" encoding="UTF-8"?>" > "$1"
	vim -c 'startinsert' "$1" +2
}

chooseName(){
	echo "Ingrese el nombre del programa:"
	read nombre
	clear
	menu $nombre
}

menu(){
	if [ -e "$1" ]
	then
		cond1=0
		echo "El archivo ya existe."
		while [ $cond1 -eq 0 ]
		do
			echo "Deseas borrarlo (d), reemplazarlo (r), editarlo (e), nuevo (n), o salir (s) ?"
			read a
			if [ "$a" = "D" ] || [ "$a" = "d" ]
			then
				delete $1
				cond1=1
			elif [ "$a" = "R" ] || [ "$a" = "r" ]
			then
				delete $1
				new $1
				cond1=1
			elif [ "$a" = "E" ] || [ "$a" = "e" ]
			then
				vim -c 'startinsert' "$1"
			elif [ "$a" = "N" ] || [ "$a" = "n" ]
			then
				clear
				chooseName
			elif [ "$a" = "S" ] || [ "$a" = "s" ]
			then
				exit 0
			else
				clear
				echo "Escriba una opcion correcta ( D | R | E | N | S )."
			fi		
		done
	else
		new $1
	fi
}


if [ $# -eq 1 ]
then
	menu $1
else
	chooseName
fi