FROM debian:bullseye

RUN apt-get update && apt-get install -y redis

RUN sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf
RUN sed -i "s/maxmemory <bytes>/maxmemory 64mb/g" /etc/redis/redis.conf
RUN sed -i "s/maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/g" /etc/redis/redis.conf

# Expose the default Redis port (6379)
EXPOSE 6379

# Start the Redis server when the container starts
CMD ["redis-server", "--protected-mode", "no"]
