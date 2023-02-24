# Downloading the model

python download_model.py

# Building container

docker build -t stablediffusion .

# Running

docker run -p 4000:80 -v /Users/brianfoody/apps/personal/storytime/packages/avatars2/images:/images stablediffusion
