#!/bin/bash

# 快速启动一个apache+php的环境

docker run --rm -p 80:80 -v "$PWD":/var/www/html php7.3-apache
