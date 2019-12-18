docker build . -t ci
docker run -e GH_PERSONAL_TOKEN="${GH_PERSONAL_TOKEN}" ci
