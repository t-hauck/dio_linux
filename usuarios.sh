#!/usr/bin/env bash
##
######## GRUPOS DE USUARIOS
GROUP=("GRP_ADM" "GRP_VEN" "GRP_SEC")
for item_group in "${GROUP[@]}"; do
    groupadd $item_group

######## DIRETORIOS

    DIR=("/public" "/adm" "/ven" "/sec")
    for item_dir in "${DIR[@]}"; do ### For DENTRO DE For
        mkdir $item_dir 2> /dev/null ## mkdir: cannot create directory * File exists

        if [[ $item == ${DIR[1]} ]]; then #### Diretório Público
            chmod 777 $item_dir
        else
            chmod 770 $item_dir              # PERMISSÕES 
            chown root:$item_group $item_dir # usuario/Grupo DONO
        fi
    done
done ###

######## USUARIOS DO SISTEMA

USERS_1=("carlos" "maria" "joao" "fabio")
for item_user1 in "${USERS_1[@]}"; do
    useradd $item_user1 -m -s $SHELL -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done
####
USERS_2=("debora" "sebastiana" "roberto" "luis" )
for item_user2 in "${USERS_2[@]}"; do
    useradd $item_user2 -m -s $SHELL -p $(openssl passwd -crypt Senha123) -G GRP_VEN
done
####
USERS_3=("josefina" "amanda" "rogerio" "mauro")
for item_user3 in "${USERS_3[@]}"; do
    useradd $item_user3 -m -s $SHELL -p $(openssl passwd -crypt Senha123) -G GRP_SEC
done

######## USUARIOS CONVIDADOS

max_users=13
for (( i=1; i <= $max_users; ++i )); do
    useradd convidado$i -c "Usuário convidado" -s $SHELL -m -p $(openssl passwd -crypt Senha$i)
    passwd convidado$i -e >/dev/null 2>&1 ## Solicitar Nova senha no Login, ATUAL: Senha + numero do usuario
done
