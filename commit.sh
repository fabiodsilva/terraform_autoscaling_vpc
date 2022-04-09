!/bin/bash



git status
echo "--------------------------------------------------------------"
git add *
echo "--------------------------------------------------------------"

git status
echo "--------------------------------------------------------------"

git commit -m "teste atlantis $2"
echo "--------------------------------------------------------------"

#git push -u origin $1
#git push --set-upstream origin $1

git push



echo "FIM DO COMMIT"
