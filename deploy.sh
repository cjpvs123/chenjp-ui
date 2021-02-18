rm -rf dist &&
yarn build  &&
cd dist   &&
git init  &&
git add . &&
git commit -m "update" && 
git branch -M main  &&
git remote add origin git@github.com:cjpvs123/chen-ui-website.git &&
git push -f -u origin main &&
cd -
echo https://cjpvs123.github.io/chen-ui-website/#/doc/intro/index.html