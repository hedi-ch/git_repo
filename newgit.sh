#!/bin/bash
#repository section
read -p "Enter your repository name  [default:new repo]: " repo_name
repo_name=${repo_name:-new_repo}
#user name section
# -z <varible name> : use it for chek if vaible is empty
while [ -z "$user_name" ]; do
read -p "Enter the user name for gihub acount: " user_name
done
# private section
while [ "$private" != false ] && [ "$private" != true ];do
read -p "do you wont your repo private yes/no [default:no]: " private
private=${private:-false}
if [ "$private" = "no" ] ; then
private=false
elif [ "$private" = "yes" ] ; then
private=true
fi
done
#description section
#read -p "Enter description for repo <you can skip by click enter buton>: " description
#initial commit with empty README.md
while [ "$readme" != false ] && [ "$readme" != true ]; do
read -p "you wont to initial commit with empty README.md ?<<yes/no>>: " readme
if [ "$readme" = "yes" ]; then
readme=true
elif [ "$readme" = "no" ]; then
readme=false
fi
done
#visibility section
while [ "$visibility" != false ] && [ "$visibility" != true ]; do
read -p "do you wont your repo to be visibility or no ?<<yes/no>>: " visibility
if [ "$visibility" = "yes" ]; then
visibility=true
elif [ "$visibility" = "no" ]; then
visibility=false
fi
done
json='{"name":"'$repo_name'","private":'$private',"auto_init":'$readme',"visibility":'$visibility'}'
#Create a new public GitHub repository
echo 'pls put your token insted of github password'
curl -u "$user_name" https://api.github.com/user/repos -d $json
#Push new repository to Github
#Using the URL we snagged above, add the remote repository as the origin
#git remote add origin "git@github.com:"$user_name"/"$repo_name".git"
#Then rename the master branch to main
#git branch -m master main
#Finally, push the main branch to remote
#git push -u origin main
#############Check out your newly populated repo in GitHub, and happy coding!################
###git the repo on your machine
git clone "git@github.com:"$user_name"/"$repo_name".git"
