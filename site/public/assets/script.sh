#!/bin/bash

java -version #verifica versao atual do java

if [ $? = 0 ]; #se retorno for igual a 0

	then #entao,
		echo “java instalado” #print no terminal
		sudo apt update && sudo apt upgrade -y
		echo "Gostaria de instalar a aplicação da Nexus Center? [s/n]"
		
		read get
	if [ \"$get\" == \"s\" ]; 
	then 
	git clone https://github.com/Nexus-Center/JavaEC2.git
	cd JavaEC2/
	unzip NexusCenter.zip
	cd NexusCenter/
	cd Cloud/
	cd nexus-center-java/
	cd target/
	java -jar nexus-center-java-1.0-SNAPSHOT-jar-with-dependencies.jar
	fi

	else #se nao,
		echo “java não instalado” #print no terminal
		echo “gostaria de instalar o java? [s/n]” #print no terminal

		read get #variável que guarda resposta do usuário
	if [ \“$get\” == \“s\” ]; #se retorno for igual a 0

	then #entao
	sudo apt install openjdk-17-jre -y #executa instalacao do java

	fi #fecha o 2º if

fi #fecha o 1º if
