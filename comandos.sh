```bash
#!/bin/bash

# AWS re/Start - Laboratório 235
# Trabalhar com Arquivos no Linux
#
# Este arquivo documenta os principais comandos utilizados no laboratório.
# Os comandos não precisam ser executados todos de uma vez, pois alguns
# dependem da estrutura e do diretório atual.
#
# A conexão real com a instância foi feita no Windows utilizando PuTTY,
# a chave labsuser.ppk e o usuário ec2-user.


# ==========================================================
# VERIFICAR O DIRETÓRIO ATUAL
# ==========================================================

# Mostrar o diretório atual
pwd

# Acessar o diretório home do usuário
cd /home/ec2-user


# ==========================================================
# VERIFICAR A ESTRUTURA DA COMPANYA
# ==========================================================

# Listar recursivamente os arquivos e diretórios de CompanyA
ls -R CompanyA


# ==========================================================
# CRIAR O BACKUP
# ==========================================================

# Criar um backup compactado da estrutura completa de CompanyA
tar -csvpzf backup.CompanyA.tar.gz CompanyA

# Verificar se o arquivo de backup foi criado
ls


# ==========================================================
# CRIAR O ARQUIVO DE LOG DO BACKUP
# ==========================================================

# Entrar no diretório CompanyA
cd /home/ec2-user/CompanyA

# Criar o arquivo de registro
touch SharedFolders/backups.csv


# ==========================================================
# REGISTRAR DATA, HORA E NOME DO BACKUP
# ==========================================================

# Escrever as informações do backup no arquivo backups.csv
#
# O operador | envia a saída do echo para o comando tee.
# O tee grava a informação no arquivo e também mostra no terminal.

echo "25 Aug 25 2021, 16:59, backup.CompanyA.tar.gz" | sudo tee SharedFolders/backups.csv


# ==========================================================
# VISUALIZAR O REGISTRO
# ==========================================================

# Exibir o conteúdo do arquivo de log
cat SharedFolders/backups.csv


# ==========================================================
# MOVER O BACKUP
# ==========================================================

# Confirmar o diretório atual
pwd

# Mover o backup para o diretório IA
mv ../backup.CompanyA.tar.gz IA/


# ==========================================================
# VALIDAR A MOVIMENTAÇÃO
# ==========================================================

# Listar o conteúdo de CompanyA e IA
ls . IA


# O backup deve estar agora em:
#
# /home/ec2-user/CompanyA/IA/backup.CompanyA.tar.gz
```
