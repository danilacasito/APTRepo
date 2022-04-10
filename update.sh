export EMAIL="danilacasito8@gmail.com"
export GITHUB_USERNAME="danilacasito"

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" --abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease

git add .
git commit -m "update"
git push
