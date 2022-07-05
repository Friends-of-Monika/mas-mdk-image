ARG MAS_RELEASE

FROM ubuntu:22.04 AS ubuntu
RUN apt update -y && apt install -y curl unzip

RUN mkdir /mdk
COPY --from=multimokia/ddlc-mod-base:latest /ddlcbase /mdk/mas
COPY --from=multimokia/ddlc-mod-base:latest /renpy /mdk/renpy

ADD install-mas.sh /tmp/install-mas.sh
RUN /tmp/install-mas.sh && rm /tmp/install-mas.sh $MAS_RELEASE