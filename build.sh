#!/bin/bash

xcodebuild clean && \
xcodebuild \
-scheme Exploration
-sdk iphonesimulator
-destination 'platform=iOS Simulator,name=iPhone 14' 
test \
| tee xcodebuild.log && \
/opt/homebrew/bin/xcbeautify --report-path /test-reports --report junit < xcodebuild.log