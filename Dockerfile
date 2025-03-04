# Use the Rust base image
FROM rust:latest

# Set the working directory
WORKDIR /usr/src/app

# Copy the application source code
COPY . .

# Build the Rust application
RUN cargo build --release
RUN echo "Application built successfully" && \
    echo "Application running..."
# Set the entry point
CMD ["./target/release/myapp"]
