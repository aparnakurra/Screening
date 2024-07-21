# Use a minimal base image
FROM alpine:3.12
# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# Switch to the non-root user
USER appuser
# Copy application files
COPY . /app
# Set the working directory
WORKDIR /app
# Run the application
CMD ["./app"]