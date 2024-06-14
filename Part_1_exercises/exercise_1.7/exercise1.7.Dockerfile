# Start from the alpine image
FROM ubuntu:22.04

#Install curl
RUN apt-get update
RUN apt-get install -y curl

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# Copy the script.sh file from this location to /usr/src/app/ creating /usr/src/app/script.sh.
COPY script.sh .

# Alternatively, if we skipped chmod earlier, we can add execution permissions during the build.
RUN chmod +x script.sh

# When running Docker run the command will be ./script.sh
CMD ./script.sh