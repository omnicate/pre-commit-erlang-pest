FROM erlang:26-alpine

# Install git and create nonroot user
RUN apk update && apk add --no-cache git; \
    addgroup -S nonroot; \
    adduser -S nonroot -G nonroot --disabled-password

# Clone the okeuday/pest repository
RUN git clone https://github.com/okeuday/pest.git

# Use the nonroot user
USER nonroot

# Set the working directory to the pest directory
WORKDIR /pest
