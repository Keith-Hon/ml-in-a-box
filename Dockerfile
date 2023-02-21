FROM ubuntu:20.04

# add sudo
RUN apt-get update && apt-get -y install sudo

# fix the error below
# debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

# Install dependencies
WORKDIR /tmp
COPY ./ml_in_a_box.sh ./ml_in_a_box.sh
# make it executable
RUN chmod +x ./ml_in_a_box.sh
# run the script
RUN ./ml_in_a_box.sh