aws ecr get-login-password | docker login --username AWS --password-stdin 273058101644.dkr.ecr.us-east-1.amazonaws.com
git pull origin main
docker-compose pull
docker-compose down
sleep 1
docker-compose up -d
sleep 1
yes | docker image prune
