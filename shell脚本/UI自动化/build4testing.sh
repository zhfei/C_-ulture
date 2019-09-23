#!/bin/bash

cd /Users/zhoufei/Documents/DemoDir

xcodebuild build-for-testing \
-workspace "demo.xcworkspace" \
-scheme "demo" \
-destination "platform=iOS Simulator,name=iPhone 6,OS=12.0" \
-derivedDataPath "output"


