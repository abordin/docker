echo "Iniciando contrução do Debian-slim"

cd .\..\debian\

mkdir shared

copy  .\..\shared\*.* shared

docker build -t andersonbordin/debian-stretch-slim .

Remove-Item shared -recurse

cd .\..\scripts