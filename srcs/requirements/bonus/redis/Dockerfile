FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

# Expose the default Redis port (6379)
EXPOSE 6379

# Start the Redis server when the container starts
CMD ["redis-server"]
