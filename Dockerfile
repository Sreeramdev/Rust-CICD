# Use the Rust base image
FROM rust:1.75

# Set the working directory
WORKDIR /usr/src/app

# Copy the application source code
COPY . .

# Build the Rust application
RUN cargo build --release

# Set the entry point
CMD ["./target/release/myapp"]
