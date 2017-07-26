## Docker images

Imagens criadas para auxiliar no desenvolvimento em PHP na empresa Inovadora Sistemas. O funcionamento correto está condicionado a estrutura de diretórios abaixo mencionada, porém podes-se alterar conforme a necessidade, realizando os ajustes necessários.

- Todos os comandos devem ser executados com um usuário comum.
- Por padrão, os seus projetos devem estar dentro de "/home/USER/www/"
- É usado balanceamento de carga com o nginx, para simular a realidade do cliente.

### Instalação

Dentro do diretório do seu usuário crie um diretório www. Em seguida clone o repositório.

```bash
$ cd ~
$ mkdir www
$ git clone git@github.com:jacksonveroneze/docker.git
```

### Configuração

#### .bashrc

Adicione o arquivo bashrc.sh ao arquivo .bashrc do seu usuário.

```bash
$ nano ~/.bashrc
```

Adicione ao final do arquivo:

```bash
source /home/$USER/www/docker/bashrc.sh
```

Abra outro terminal ou recaregue as configurações do .bashrcc com o comando:

```bash
$ source ~/.bashrc
```

### Build das imagens

Para construir as imagens necessárias, acesse o diretório scripts e execute os comandos abaixo:

```bash
$ ./docker-build-debian.sh
$ ./docker-build-nginx.sh
$ ./docker-build-php.sh
$ ./docker-build-postgres.sh
```

### Criar a estrutura de diretórios necessária

Execute o comando abaixo para cirar os diretórios onde será armazenado os logs, dados, etc.

```bash
$ ./build-environment.sh
```

### Subindo os containers

##### G-MUS

```bash
$ docker-gmus
```

##### G-MUS

```bash
$ docker-gmas
```