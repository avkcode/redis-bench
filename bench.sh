#!/bin/bash

# Redis Performance Benchmarking Script
# This script runs various Redis benchmarking and latency tests to evaluate performance.
# Ensure Redis is running and accessible before executing this script.

echo "Starting Redis Benchmarking Script..."

# 1. Run a quick (quiet) benchmark for all operations
echo -e "\n[1] Running redis-benchmark -q (quick benchmark for all operations)"
redis-benchmark -q

# 2. Run a quiet benchmark for specific operations: SET and GET
echo -e "\n[2] Running redis-benchmark -t set,get -q (SET and GET operations only)"
redis-benchmark -t set,get -q

# 3. Run a quiet benchmark for SET and GET with 1000 concurrent clients
echo -e "\n[3] Running redis-benchmark -t set,get -q -c 1000 (1000 concurrent clients)"
redis-benchmark -t set,get -q -c 1000

# 4. Run a benchmark for SET operation with 100 concurrent clients and 1,000,000 requests
echo -e "\n[4] Running redis-benchmark -t set -c 100 -n 1000000 (SET operation with 100 clients and 1M requests)"
redis-benchmark -t set -c 100 -n 1000000

# 5. Run a quiet benchmark for GET and SET operations
echo -e "\n[5] Running redis-benchmark -t get,set -q (GET and SET operations only)"
redis-benchmark -t get,set -q

# 6. Run a quiet benchmark for GET and SET operations with pipelining (8 commands per pipeline)
echo -e "\n[6] Running redis-benchmark -t get,set -q -P 8 (pipelining with 8 commands)"
redis-benchmark -t get,set -q -P 8

# 7. Measure Redis server latency using redis-cli --latency
echo -e "\n[7] Measuring Redis server latency using redis-cli --latency"
redis-cli --latency

# 8. Measure Redis server latency history every second using redis-cli --latency-history
echo -e "\n[8] Measuring Redis server latency history using redis-cli --latency-history"
redis-cli --latency-history

# 9. Measure intrinsic latency of the system for 30 seconds using redis-cli --intrinsic-latency
echo -e "\n[9] Measuring intrinsic latency of the system using redis-cli --intrinsic-latency 30"
redis-cli --intrinsic-latency 30

echo -e "\nRedis Benchmarking Script Completed!"
