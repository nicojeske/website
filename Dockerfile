# syntax=docker/dockerfile:1

FROM debian:bookworm-slim AS hugo-builder
ARG HUGO_VERSION=0.165.0
ARG HUGO_SHA256=f43494894cdf4a8630a201d5c828051c77f523cc66bb3938b30806835470ac20
# The "extended" release is glibc-linked (CGO, for the SCSS pipeline), so it
# needs a glibc base image, not Alpine/musl.
RUN apt-get update \
  && apt-get install -y --no-install-recommends curl ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && curl -fsSL -o /tmp/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
  && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
  && mkdir -p /tmp/hugo-extract \
  && tar -xzf /tmp/hugo.tar.gz -C /tmp/hugo-extract \
  && install -m 0755 /tmp/hugo-extract/hugo /usr/local/bin/hugo \
  && rm -rf /tmp/hugo.tar.gz /tmp/hugo-extract \
  && hugo version

WORKDIR /src
COPY . .
RUN hugo --minify --gc

FROM nginxinc/nginx-unprivileged:1.27-alpine
COPY --from=hugo-builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
