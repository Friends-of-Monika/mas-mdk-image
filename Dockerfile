FROM multimokia/ddlc-mod-base:latest AS ddlc-mod-base
RUN mkdir /mdk && \
    mv /ddlcbase /mdk/mas && \
    mv /renpy /mdk/renpy

FROM alpine:3.16 AS mas
RUN apk add curl unzip perl docker

ARG MAS_RELEASE
ADD install-mas.sh /tmp/install-mas.sh
RUN /tmp/install-mas.sh && rm /tmp/install-mas.sh

FROM ubuntu:22.04
COPY --from=ddlc-mod-base /mdk /mdk
COPY --from=mas /game /mdk/mas/game