FROM erlang:26-alpine

# Install git and create nonroot user
RUN apk update && apk add --no-cache git

# Clone the okeuday/pest repository
RUN git clone https://github.com/okeuday/pest.git

# Set the working directory to the pest directory
WORKDIR /pest
