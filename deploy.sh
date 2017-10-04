#!/bin/bash
docker push ipanchenko/lab-node

ssh ivanpanchenko180@130.211.67.0 << EOF
docker pull ipanchenko/lab-node:latest
docker stop web || true
docker rm web || true
docker rmi ipanchenko/lab-node:current || true
docker tag ipanchenko/lab-node:latest ipanchenko/lab-node:current
docker run -d --restart always --name web -p 80:80 ipanchenko/lab-node:current
EOF
