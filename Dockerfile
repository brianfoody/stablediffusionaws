# FROM nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04
FROM nvidia/cuda:11.0.3-base

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl
RUN apt-get install unzip
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

# Set the working directory to /app
WORKDIR /var/app

# Copy the current directory contents into the container at /app
COPY . .

# RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip install --upgrade diffusers transformers accelerate
# RUN pip install torch torchvision torchaudio

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

EXPOSE 80

ENV INPUT_PROMPT "a photo of an astronaut on mars"

VOLUME /images

# Run app.py when the container launches
CMD ["python", "main.py"]
