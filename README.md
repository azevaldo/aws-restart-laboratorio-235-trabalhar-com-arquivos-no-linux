# AWS re/Start — Laboratório 235: Trabalhar com Arquivos no Linux

Laboratório prático do programa **AWS re/Start** sobre gerenciamento e backup de arquivos no Linux.

Neste laboratório foi criada uma cópia de segurança de uma estrutura completa de diretórios utilizando `tar`, registrado o momento da criação do backup e, posteriormente, o arquivo de backup foi movido para outro diretório.

## Objetivos

* Criar um arquivo de backup de uma estrutura completa de diretórios utilizando `tar`.
* Registrar a data, hora e nome do arquivo de backup.
* Armazenar o registro em um arquivo `.csv`.
* Mover o arquivo de backup para outro diretório.
* Validar os arquivos e diretórios utilizando comandos Linux.

O laboratório tem duração aproximada de 30 minutos.

## Ambiente

* **Programa:** AWS re/Start
* **Laboratório:** 235 — Trabalhar com Arquivos no Linux
* **Ambiente:** AWS Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Cliente SSH utilizado:** PuTTY
* **Sistema local:** Windows
* **Usuário:** `ec2-user`
* **Chave utilizada:** `labsuser.ppk`
* **Porta SSH:** `22`

## 1. Conexão com a instância EC2

Após iniciar o laboratório, foi necessário obter o endereço IP público da instância e baixar a chave `labsuser.ppk`.

No Windows, a conexão foi realizada utilizando o **PuTTY**.

Configuração da sessão:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave foi configurada em:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
```

Depois da conexão, o acesso foi realizado com:

```text
ec2-user
```

> A conexão utilizada neste laboratório foi feita no Windows utilizando PuTTY e `labsuser.ppk`.

## 2. Estrutura utilizada para o backup

O ambiente do laboratório possuía a seguinte estrutura:

```text
/home/ec2-user/CompanyA/
├── Employees/
│   └── Schedules.csv
├── Finance/
│   └── Salary.csv
├── HR/
│   ├── Assessments.csv
│   └── Managers.csv
├── IA/
├── Management/
│   ├── Promotions.csv
│   └── Sections.csv
└── SharedFolders/
```

O objetivo era criar um backup de toda a estrutura `CompanyA`.

## 3. Validando a estrutura

Primeiro, foi verificado o diretório atual:

```bash
pwd
```

Resultado esperado:

```text
/home/ec2-user
```

Depois, a estrutura da pasta `CompanyA` foi verificada:

```bash
ls -R CompanyA
```

Esse comando permite visualizar os diretórios e arquivos existentes dentro de `CompanyA`.

## 4. Criando o backup com tar

Para criar o backup completo da estrutura `CompanyA`, foi utilizado:

```bash
tar -csvpzf backup.CompanyA.tar.gz CompanyA
```

O arquivo gerado foi:

```text
backup.CompanyA.tar.gz
```

### Entendendo o comando

```text
tar -csvpzf backup.CompanyA.tar.gz CompanyA
```

| Opção | Função                                               |
| ----- | ---------------------------------------------------- |
| `c`   | Cria um novo arquivo tar                             |
| `s`   | Trabalha com o formato de arquivo utilizado pelo tar |
| `v`   | Exibe os arquivos processados                        |
| `p`   | Preserva permissões                                  |
| `z`   | Utiliza compressão gzip                              |
| `f`   | Define o nome do arquivo de saída                    |

O resultado é um arquivo compactado contendo a estrutura completa de `CompanyA`.

### Verificar o backup

```bash
ls
```

O resultado deve apresentar:

```text
backup.CompanyA.tar.gz
CompanyA
```

## 5. Criando o registro do backup

Depois de criar o backup, foi necessário registrar informações sobre ele.

Primeiro, foi acessado o diretório `CompanyA`:

```bash
cd /home/ec2-user/CompanyA
```

Foi criado o arquivo:

```bash
touch SharedFolders/backups.csv
```

O arquivo `backups.csv` foi utilizado para armazenar:

* Data do backup.
* Hora do backup.
* Nome do arquivo de backup.

Para registrar essas informações:

```bash
echo "25 Aug 25 2021, 16:59, backup.CompanyA.tar.gz" | sudo tee SharedFolders/backups.csv
```

O comando utiliza o operador `|` para encaminhar a saída do `echo` para o comando `tee`.

O `tee` grava a informação no arquivo e também exibe o conteúdo no terminal.

### Verificar o registro

```bash
cat SharedFolders/backups.csv
```

Resultado esperado:

```text
25 Aug 25 2021, 16:59, backup.CompanyA.tar.gz
```

## 6. Movendo o backup

Depois de criar o backup e registrar suas informações, o arquivo foi movido para o diretório `IA`.

Primeiro, foi confirmado o diretório atual:

```bash
pwd
```

Resultado:

```text
/home/ec2-user/CompanyA
```

Depois, o backup foi movido:

```bash
mv ../backup.CompanyA.tar.gz IA/
```

### Verificar a movimentação

```bash
ls . IA
```

O resultado deve mostrar o arquivo dentro de `IA`:

```text
IA:
backup.CompanyA.tar.gz
```

O arquivo deixa de estar diretamente em `/home/ec2-user` e passa a estar em:

```text
/home/ec2-user/CompanyA/IA/backup.CompanyA.tar.gz
```

## 7. Principais comandos praticados

| Comando | Função                                               |
| ------- | ---------------------------------------------------- |
| `pwd`   | Mostra o diretório atual                             |
| `ls`    | Lista arquivos e diretórios                          |
| `ls -R` | Lista recursivamente os conteúdos                    |
| `tar`   | Cria e manipula arquivos de backup                   |
| `touch` | Cria um arquivo vazio                                |
| `echo`  | Exibe ou envia texto para outro comando              |
| `tee`   | Escreve a entrada em um arquivo e também no terminal |
| `cat`   | Exibe o conteúdo de um arquivo                       |
| `mv`    | Move arquivos ou diretórios                          |

## 8. O que aprendi

Neste laboratório pratiquei:

* Criação de backups utilizando `tar`.
* Compressão de arquivos utilizando gzip.
* Backup de uma estrutura completa de diretórios.
* Registro de informações sobre um backup.
* Uso do operador `|`.
* Utilização do comando `tee`.
* Visualização do conteúdo de arquivos com `cat`.
* Movimentação de arquivos entre diretórios.
* Validação de estruturas de arquivos utilizando `ls`.

## Conclusão

O Laboratório 235 reforçou conceitos importantes de gerenciamento de arquivos no Linux, principalmente a criação e organização de backups.

A prática mostrou como transformar uma estrutura de diretórios em um arquivo compactado utilizando `tar`, registrar informações sobre o backup e posteriormente movimentá-lo para outro diretório.

## Arquivos do repositório

```text
README.md       # Documentação do laboratório
comandos.sh     # Comandos praticados durante o laboratório
.gitignore      # Arquivos que não devem ser enviados ao GitHub
```
