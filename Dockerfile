FROM debian:bookworm AS builder  # More recent GLIBC version

RUN apt update && apt install -y curl build-essential

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

# Final Stage: Create a smaller runtime image
FROM debian:bookworm  # Same base image

WORKDIR /usr/local/bin

COPY --from=builder /usr/src/app/target/release/myapp .

CMD ["./myapp"]
