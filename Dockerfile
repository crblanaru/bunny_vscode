FROM linuxserver/code-server:4.4.0

# Rust as the base image
ENV DEBIAN_FRONTEND=noninteractive RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo PATH=/usr/local/cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin RUST_VERSION=1.51.0
ENV rustArch=x86_64-unknown-linux-gnu rustupSha256=ed7773edaf1d289656bdec2aacad12413b38ad0193fff54b2231f5140a4b07c5

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates vim gcc libc6-dev wget \
 && url="https://static.rust-lang.org/rustup/archive/1.23.1/${rustArch}/rustup-init" \
 && wget -q "$url" \
 && echo "${rustupSha256} *rustup-init" | sha256sum -c - \
 && chmod +x rustup-init \
 && ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch} \  
 && rm rustup-init \
 && chmod -R a+w $RUSTUP_HOME $CARGO_HOME \
 && rustup --version \
 && cargo --version \
 && rustc --version \
 && apt-get remove -y --auto-remove wget \
 && rm -rf /var/lib/apt/lists/*

