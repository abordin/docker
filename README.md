## Docker images

Imagens criadas para auxiliar no desenvolvimento em PHP. O funcionamento correto está condicionado a estrutura de diretórios abaixo mencionada, porém pode-se alterar conforme a necessidade, realizando os ajustes necessários.

- Todos os comandos devem ser executados com um usuário comum.
- Por padrão, os seus projetos devem estar dentro de */home/USER/www/*.
- É usado balanceamento de carga com o nginx, para simular a realidade do cliente.

### Instalação

Dentro do home do seu usuário crie um diretório www. Em seguida clone o repositório.

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
$ ./docker-build-haproxy.sh
$ ./docker-build-php.sh
$ ./docker-build-postgres.sh
```

### Criar a estrutura de diretórios necessária

Execute o comando abaixo para cirar os diretórios onde será armazenado os logs, dados, etc.

```bash
$ ./build-environment.sh
```

### Comandos

##### Subir G-MUS

```bash
$ docker-gmus
```

##### Subir G-MAS

```bash
$ docker-gmas
```

##### Subir G-MAS(Criptografado)

```bash
$ docker-gmus-crypt
```

##### Subir G-MAS(Criptografado)

```bash
$ docker-gmas-crypt
```

##### Apagar todos os containers

```bash
$ docker-clear
```
##### Listar os containers e seu uso

```bash
$ docker-stats
```

##### Remover imagens não utilizadas do cache local

```bash
$ docker-clear-images
```

docker rmi $(docker images -f "dangling=true" -q)


## Documentation

### Author

Jackson Veroneze - <jackson@jacksonveroneze.com> - <http://jacksonveroneze.com>
See also the list of [contributors](https://github.com/jacksonveroneze/docker/graphs/contributors) which participated in this project.

### License

Docker Images is licensed under the MIT License - see the `LICENSE` file for details

