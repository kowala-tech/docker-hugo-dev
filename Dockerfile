FROM deis/go-dev

RUN apt-get update

# Ruby
RUN apt-get install hugo ruby ruby-dev curl apt-utils -y
RUN gem install sass --no-user-install

# Node.JS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install nodejs -y

# Typescript
RUN npm install -g typescript

# Fontcustom
RUN apt-get install zlib1g-dev fontforge -y
RUN git clone https://github.com/bramstein/sfnt2woff-zopfli.git sfnt2woff-zopfli && cd sfnt2woff-zopfli && make && mv sfnt2woff-zopfli /usr/local/bin/sfnt2woff
RUN git clone --recursive https://github.com/google/woff2.git && cd woff2 && make clean all && mv woff2_compress /usr/local/bin/ && mv woff2_decompress /usr/local/bin/
RUN gem install --no-document fontcustom

# Set up the workspace
RUN mkdir -p /kowala
WORKDIR /kowala/kowala.tech
ENV PATH=$PATH:/kowala/workspace/bin
