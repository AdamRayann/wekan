# Stage 1: Download Dependencies
FROM scratch AS downloads

# Download NodeJS bundle
ADD https://static.meteor.com/dev-bundle-node-os/v14.21.4/node-v14.21.4-linux-x64.tar.gz node.tar.gz

# Download Meteor bundle
ADD https://static.meteor.com/packages-bootstrap/2.16/meteor-bootstrap-os.linux.x86_64.tar.gz meteor.tar.gz

# Stage 2: Build Wekan
FROM ubuntu:24.04 AS build

# Install dependencies
RUN apt update && \
    apt install --yes --no-install-suggests --no-install-recommends \
    ssh git g++ curl ca-certificates python3 && \
    rm -r /var/lib/apt/lists

# Install node from official archive
RUN --mount=type=bind,from=downloads,source=node.tar.gz,target=node.tar.gz \
    tar xzf node.tar.gz --strip-components=1 --keep-old-files --no-same-owner

# Install meteor from official archive
RUN --mount=type=bind,from=downloads,source=meteor.tar.gz,target=meteor.tar.gz \
    tar xzf meteor.tar.gz -C $HOME --no-same-owner

# Update the npm version
RUN npm install -g npm@6.14.17

# Set working directory
WORKDIR /workdir

# Copy Wekan source code into the container
COPY . .

# Install Meteor and build Wekan
RUN $HOME/.meteor/meteor npm install && \
    $HOME/.meteor/meteor build --directory /build --server-only --allow-superuser

# Set working directory to server bundle
WORKDIR /build/bundle/programs/server

# Install production dependencies
RUN npm install --production

# Stage 3: Prepare Wekan Runtime
FROM ubuntu:24.04 AS wekan

# Set metadata
LABEL maintainer="wekan-custom"
LABEL org.opencontainers.image.source="https://github.com/wekan/wekan"

# Install node and copy application bundle
RUN --mount=type=bind,from=downloads,source=node.tar.gz,target=node.tar.gz \
    tar xzf node.tar.gz --strip-components=1 --keep-old-files --no-same-owner && \
    useradd --uid 999 --user-group --system wekan

# Copy Wekan from build stage and set correct permissions
COPY --from=build --chown=wekan:wekan /build /wekan

# Change to the wekan user
USER wekan

# Expose the necessary port
ENV PORT=8080
EXPOSE ${PORT}

# Set required environment variables
ENV ROOT_URL=http://localhost:8080
ENV MONGO_URL=mongodb://localhost:27017/wekan
ENV MONGO_OPLOG_URL=mongodb://localhost:27017/local
ENV WRITABLE_PATH="/wekan_storage"
ENV WITH_API=true
ENV BASE_SORT_URL=http://localhost:5001

# Define a volume for persistent data
VOLUME /data

# Set startup command
CMD ["node", "/wekan/bundle/main.js"]
