# Use the official Rust image as the base image
FROM rust:latest as builder

RUN apt-get -y update;

WORKDIR /workspace

# RUN pwd && ls -al && curl -L https://install.dojoengine.org | && source /root/.bashrc && bash && dojoup

RUN git clone https://github.com/dojoengine/dojo && cd dojo && cargo install --path ./crates/katana --locked --force

CMD [ "katana" ]

# FROM debian:buster-slim as buidocker
# RUN apt-get -y update; \
#     WORKDIR /workspace
# COPY . .

# RUN apt-get -y update; \
#     apt-get install -y --no-install-recommends \
#     curl; \
#     apt-get autoremove -y; \
#     apt-get clean; \
#     rm -rf /var/lib/apt/lists/*

# ENV HEALTH_CHECK_PORT=5050

# # HEALTHCHECK --interval=3s --timeout=5s --start-period=1s --retries=5 \
# #     CMD curl --request POST \
# #     --header "Content-Type: application/json" \
# #     --data '{"jsonrpc": "2.0","method": "starknet_chainId","id":1}' http://localhost:${HEALTH_CHECK_PORT} || exit 1
