# make sure you're logged in with `huggingface-cli login`
from diffusers import StableDiffusionPipeline
import os

pipe = StableDiffusionPipeline.from_pretrained("./stable-diffusion-v1-5")
pipe = pipe.to("mps")

pipe.safety_checker = lambda images, clip_input: (images, False)

# Recommended if your computer has < 64 GB of RAM
pipe.enable_attention_slicing()

prompt = os.environ['INPUT_PROMPT']

# First-time "warmup" pass (see explanation above)
_ = pipe(prompt, num_inference_steps=1)

# Results match those from the CPU device after the warmup pass.
image = pipe(prompt).images[0]

# save image to "./png"
image.save("images/output.png")
