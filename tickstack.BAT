@echo [off]
title Web Docker Tickstack
cd :D
cd temp
git clone https://github.com/oves-embedded/web-docker-tickStack.git
cd web-docker-tickStack
docker-compose up -d
pause