# Stash new changes
echo "Stashing new changes"
git stash
echo "Stashed changes"

# Pull Changes from main repo
echo "Pulling changes from main branch"
git pull origin main
echo "Changes pulled successfully"

# Unstash new changes
echo "Unstashing new changes"
git stash pop
echo "Unstashing changes successfully"

# Update Docker containers after getting new changes
echo "Updating Tick Stack docker containers"
docker-compose up -d
echo "Updated the containers"
