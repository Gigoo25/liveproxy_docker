# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Install streamlink
RUN python -m pip install --upgrade git+https://github.com/streamlink/streamlink.git

# Install liveproxy
RUN python -m pip install --upgrade git+https://github.com/back-to/liveproxy.git

EXPOSE 53422

# Start liveproxy
CMD ["liveproxy", "--host", "0.0.0.0", "--port", "53422"]
