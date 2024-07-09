FROM nginx:1.26.1-alpine

ENV TIMEZONE=Europe/Brussels

# Install Alpine configuration management scripts (needed for setup-timezone).
RUN apk add alpine-conf

# Set timezone with setup-timezone script.
# https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts#setup-timezone
RUN setup-timezone -z $TIMEZONE
