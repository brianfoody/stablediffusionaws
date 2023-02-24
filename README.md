# Downloading the model

python download_model.py

# Building container

docker build -t stablediffusion .

# Running

docker run -p 4000:80 -v /Users/brianfoody/apps/personal/storytime/packages/avatars2/images:/images stablediffusion
docker run -v /Users/brianfoody/apps/personal/storytime/packages/avatars2/images:/images stablediffusion
docker run -v /home/ec2-user/stablediffusionaws/images:/images stablediffusion

# Running on AWS Ec2

git clone https://github.com/brianfoody/stablediffusionaws.git

python3 -m pip install --upgrade diffusers transformers accelerate
python3 -m pip install torch torchvision torchaudio
python3 download_model.py

# Connecting to ec2 and Pushing to ecs

See SD_AWS.md

# Grabbing files for testing

scp -i ./SensiveStableDiffusionUsWest1.pem ./img.png ec2-user@ip-172-31-9-213:/home/ec2-user/stablediffusionaws/images/output.png

# Checking the drivers (cuda and CuDNN)

nvcc --version  
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

or

nvidia-smi

FROM nvidia/cuda:11.7-cudnn8-runtime-ubuntu18.04
