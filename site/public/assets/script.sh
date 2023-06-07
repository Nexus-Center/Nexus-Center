#!/bin/bash
PURPLE='\033[0;30m'
NC='\033[0m'
VERSAO=17

echo  "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0)
       ___  ___
    * |   \ | | ____  __  __  _   _    ____ *
  *   |    \| |/  _ \ \ \/ / | | | |  /  __|  *
   *  |  |\   |   __/ /    \ | |_| | _\  \   *
 *    |__| \__|\____|/__/\__\ \___/ /____/    *

       ____               _
   *  /  __\ ____ __  __ | |__  ____  ____  *
 *   |  /   /  _ \| \ | ||  __|/  _ \|  _ \   *
   * |  \___|  __/|  \| || |__ |  __/|    / *
 *    \____/\____||_|\__|\____|\____||_|\_\   *
 "
echo  "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Olá seja bem-vindo(a) a Nexus Center, serei seu assistente para instalação do Java!;"
echo  "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Verificando aqui se você possui o Java instalado...;"
sleep 3

java -version
if [ $? -eq 0 ]
	then
			echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Você já possui uma versão do Java instalada!"
			echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Deseja instalar a aplicação da Nexus Center (s/n)?"
		read inst
		if [ \"$inst\" == \"s\" ]
			then
			git clone https://github.com/Nexus-Center/JavaEC2.git
			cd JavaEC2/
			java -jar nexus-center-java-1.0-SNAPSHOT-jar-with-dependencies.jar
		fi
			# Automatização para criação de container Nexus Center
			echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Deseja instalar o Docker para criar um container (s/n)?"
		read inst
		if [ \"$inst\" == \"s\" ]
			then
			sudo apt install docker.io #Instalar o Docker
			sudo docker pull mysql:5.7 # Baixar a imagem do MySQL
			sudo docker run -d -p 3306:3306 --name NexusCenter -e "MYSQL_DATABASE=NexusCenter" -e "MYSQL_ROOT_PASSWORD=NexusCenter" mysql:5.7
			sudo docker exec -it NexusCenter bash # Acessar o bash do container
		fi
	else
		echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Nenhuma versão foi identificada, a instalação do Java é necessária para iniciar a nossa aplicação!"
		echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Deseja iniciar a instalação do Java (s/n)?"
	read inst
	if [ \"$inst\" == \"s\" ]
		then
			echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Iniciando a instalação..."
			echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Estamos atualizando os pacotes do sistema..."
			sleep 2
			sudo apt update && sudo apt upgrade
			clear
			if [ $VERSAO -eq 17 ]
				then
					echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Preparando para instalar a versão 17 do Java. Por favor, confirme a instalação quando for solicitada:"
					sudo apt install openjdk-17-jre
					clear
					echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Java instalado com sucesso!"
					echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Execute novamente o script "
			fi
		else 	
		echo "$(tput setaf 4)[Bot Nexus Center]:$(tput setaf 0) : Você optou por não instalar o Java por enquanto, até mais!"
	fi
fi
