FROM deis/go-dev

# Ruby
RUN apt-get update
RUN apt-get install hugo ruby ruby-dev curl apt-utils -y
RUN gem install sass --no-user-install

# Node.JS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install nodejs -y

# Set up the workspace
RUN mkdir -p /kowala
WORKDIR /kowala/kowala.tech
ENV PATH=$PATH:/kowala/workspace/bin
