FROM rust:latest AS builder

WORKDIR /usr/src/app

# Install musl target
RUN rustup target add x86_64-unknown-linux-musl

COPY . .

# Build the Rust application statically
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:latest  # Smallest runtime image

WORKDIR /usr/local/bin

COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/myapp .

CMD ["./myapp"]
