echo "Iniciando contrução do nGinx com PHP"

cd .\..\php-nginx\

mkdir shared

copy .\..\shared\* shared

move .\shared\nginx-default-php .\shared\default

docker build -t andersonbordin/nginx-php .

Remove-Item shared -recurse

cd .\..\scripts