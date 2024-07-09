FROM nginx:1.27-alpine

ARG TIMEZONE=UTC
ENV TIMEZONE=$TIMEZONE

# Install Alpine configuration management scripts (needed for setup-timezone).
RUN apk add alpine-conf

# Set timezone with setup-timezone script.
# https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts#setup-timezone
RUN setup-timezone -z $TIMEZONE
