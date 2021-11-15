FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  wget \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/* && \
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda

ENV PATH=/root/miniconda/bin:$PATH

COPY requirements.txt requirements.txt
RUN pip3 --no-cache-dir install -r requirements.txt

COPY ./src /app

ENTRYPOINT ["/root/miniconda/bin/python3.9", "/app/app.py"]
