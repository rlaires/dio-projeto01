#!/bin/bash

#Cria pastas solicitadas
echo "Criando pastas"
echo ""

mkdir /publico
echo "Pasta publico criada"
echo ""

mkdir /adm
echo "Pasta adm criada"
echo ""

mkdir /ven
echo "Pasta ven criada"
echo ""

mkdir /sec
echo "Pasta sec criada"
echo ""

#Cria grupos solicitados
echo "Criando grupos"
echo ""

groupadd GRP_ADM
echo "Grupo ADM criado"
echo ""

groupadd GRP_VEN
echo "Grupo VEN criado"
echo ""

groupadd GRP_SEC
echo "Grupo SEC criado"
echo ""

#Cria usuários solicitados, ja com os pametros adicionais - pasta home, bash, senha (mesma para todos) e adicionando no grupo
echo "Criando usuários..."
echo ""

useradd carlos -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_ADM
echo "Uusuários Carlos, Maria e João criados e adicionados no grupo GRP_ADM"
echo ""

useradd debora -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_VEN
echo "Uusuários Debora, Sebastiana e Roberto criados e adicionados no grupo GRP_VEN"
echo ""

useradd josefina -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 123@qwe) -G GRP_SEC
echo "Uusuários Josefina, Amanda e Rogerio criados e adicionados no grupo GRP_SEC"
echo ""

#Altera permissões das pastas para as solicitadas
echo "Especificando permissões dos diretórios...."
echo ""

chown root:GRP_ADM /adm
chmod 770 /adm
echo "Permissões da pasta adm alteradas"
echo ""

chown root:GRP_VEN /ven
chmod 770 /ven
echo "Permissões da pasta ven alteradas"
echo ""

chown root:GRP_SEC /sec
chmod 770 /sec
echo "Permissões da pasta sec alteradas"
echo ""

chmod 777 /publico
echo "Permissões da pasta publico alteradas para todos tem acesso de leitura e escrita"
echo ""

read -p "Pressione qualquer tecla para finalizar"
