#!/bin/bash

#raspivid -o - -t 0 -rot 180 -w 1920 -h 1080 -fps 30 -b 2000000 | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/x}' :demux=h264

raspivid -o - -t 0 -rot 180 -w 1920 -h 1080 -fps 25 -b 2000000 | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/y}' :demux=h264
