FROM python:latest

RUN apt-get update
# RUN apt-get install -y python3
# RUN apt-get install -y python3-venv
RUN apt-get install -y git
RUN apt-get install -y python3-pip

# add default user
RUN adduser --disabled-password duser
# COPY ./stable-diffusion-webui /home/duser/stable-diffusion-webui
# RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /home/duser/stable-diffusion-webui
RUN git clone --branch initializer https://github.com/brownian-motion/stable-diffusion-webui.git /home/duser/stable-diffusion-webui
RUN chown -R duser:duser /home/duser
WORKDIR /home/duser/stable-diffusion-webui
RUN "/usr/bin/python3" "launch.py" "--initialize-only" "--use-cpu=all" "--skip-torch-cuda-test"
USER duser

#ENTRYPOINT ["python3", "launch.py", "--use-cpu=all", "--skip-torch-cuda-test"]