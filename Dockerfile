FROM linuxserver/code-server:4.4.0

# Rust as the base image
ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/cargo PATH=/usr/local/cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin RUST_VERSION=1.51.0
RUN /bin/sh -c set -eux;     
RUN apt-get update;     apt-get install -y --no-install-recommends         ca-certificates    vim     gcc         libc6-dev         wget         ;     
ENV rustArch=x86_64-unknown-linux-gnu rustupSha256=ed7773edaf1d289656bdec2aacad12413b38ad0193fff54b2231f5140a4b07c5
RUN url="https://static.rust-lang.org/rustup/archive/1.23.1/${rustArch}/rustup-init";     wget "$url";     echo "${rustupSha256} *rustup-init" | sha256sum -c -; 
RUN chmod +x rustup-init;     ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch};  
RUN rm rustup-init;     chmod -R a+w $RUSTUP_HOME $CARGO_HOME;    
RUN rustup --version 
RUN cargo --version
RUN rustc --version
RUN apt-get remove -y --auto-remove wget
RUN rm -rf /var/lib/apt/lists/*
