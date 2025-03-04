# First stage: Build Rust app
FROM rust:1.75 AS builder

WORKDIR /usr/src/app
COPY . .
RUN cargo build --release

# Second stage: Create a minimal runtime image
FROM debian:buster-slim

WORKDIR /usr/local/bin
COPY --from=builder /usr/src/app/target/release/rust-docker-app .

CMD ["./rust-docker-app"]

