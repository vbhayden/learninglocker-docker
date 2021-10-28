#/bin/bash

if [ "$#" -eq "3" ]; then
    docker-compose exec api node cli/dist/server createSiteAdmin $1 $2 $3
else
  echo "Invalid number of arguments provided, must pass 3 in order: [email] [organization] [password]"
fi
