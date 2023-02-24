# Downloading the model

python download_model.py

# Building container

docker build -t stablediffusion .

# Running

docker run -p 4000:80 -v /Users/brianfoody/apps/personal/storytime/packages/avatars2/images:/images stablediffusion

# Running on AWS Ec2

git clone https://github.com/brianfoody/stablediffusionaws.git

python3 -m pip install --upgrade diffusers transformers accelerate
python3 -m pip install torch torchvision torchaudio
python3 download_model.py

# Connecting to ec2 and Pushing to ecs

See SD_AWS.md
