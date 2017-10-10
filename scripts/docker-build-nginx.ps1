echo "Iniciando contrução do nGinx"

cd .\..\nginx\

mkdir shared
copy .\..\shared\* shared


# nginx-balance
move .\shared\entrypoint-nginx-balance.sh .\shared\launch.sh
move .\shared\nginx-default-balance .\shared\default
docker build -t andersonbordin/nginx-balance .

# nginx-proxy
move .\shared\entrypoint-nginx-proxy.sh .\shared\launch.sh
move .\shared\nginx-default-proxy .\shared\default
docker build -t andersonbordin/nginx-proxy .

# nginx-proxy-basic-auth
move .\shared\entrypoint-nginx-proxy.sh .\shared\launch.sh
move .\shared\nginx-default-proxy-basic-auth .\shared\default
docker build -t andersonbordin/nginx-proxy-basic-auth .

Remove-Item shared -recurse

cd .\..\scripts