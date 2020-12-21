#Ubuntu with a desktop and VNC server.  Will allow us to use gui monitor tools that these libaries have such as tensorboard
FROM codercom/code-server:latest

#switches default user to root
USER 0

#use bash for the shell
SHELL [ "/bin/bash","-c" ]

#sets the environment so that we can use conda after install
ENV PATH="~/anaconda3/condabin:${PATH}"

#Used for GPU setup
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

#Needed to build some packages
RUN apt update \
&& apt install gcc -y \
&& apt install build-essential -y \
&& apt install unzip -y \
&& apt install git -y \
&& apt install docker.io -y \
&& apt install wget -y


USER 1000
#gets the anaconda package, installs it, and adds it to the path
#gets the anaconda package
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh \
#sets the correct permissions to allow install
&& chmod 777 Anaconda3-2019.03-Linux-x86_64.sh \
#moves the package
&& mv Anaconda3-2019.03-Linux-x86_64.sh /home/coder/Anaconda3-2019.03-Linux-x86_64.sh \
#move to that directory
&& cd /home/coder \
#silently installs the package
&& ./Anaconda3-2019.03-Linux-x86_64.sh -b  \
#sets the path, may not be needed with the ENV PATH being used above
&& echo "export PATH=\"/home/coder/anaconda3/condabin:$PATH\"">>.bashrc \
&& source ~/.bashrc

RUN conda init \
&& source ~/.bashrc 
