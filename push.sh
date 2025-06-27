#!/bin/bash

set -e
aws ecr get-login-password | docker login --username AWS --password-stdin 273058101644.dkr.ecr.us-east-1.amazonaws.com
docker-compose build
docker-compose push
