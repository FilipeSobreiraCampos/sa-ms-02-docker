# sa-ms-02-docker

## Pré-instalação

Se não tiver o docker instalado, acesse o site do [Labs Play Docker](https://labs.play-with-docker.com/).

## Baixando o repositório

Faça o clone do projeto:

```bash
git clone https://github.com/FilipeSobreiraCampos/sa-ms-02-docker

Acesse o diretório do repositorio

cd sa-ms-02-docker/

## Construa a imagem

docker build -t otrs:latest .

##construa o container

docker run -d --name='www' -p 80:80 --restart=always otrs:latest



