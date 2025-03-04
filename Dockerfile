# Build Stage
FROM rust:latest AS builder

WORKDIR /usr/src/app
COPY . .

RUN cargo build --release

# Runtime Stage
FROM debian:buster-slim

WORKDIR /usr/local/bin

# Copy only the compiled binary
COPY --from=builder /usr/src/app/target/release/myapp .

# Ensure the binary is executable
RUN chmod +x /usr/local/bin/myapp

CMD ["/usr/local/bin/myapp"]
