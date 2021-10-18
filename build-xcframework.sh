#!/bin/sh
set -o pipefail

# Clean Archive iPhone SampleSDK
xcodebuild clean archive \
    -scheme SampleSDK \
    -configuration Release \
    -destination 'generic/platform=iOS' \
    -archivePath './build/SampleSDK-iphoneos.xcarchive' \
    ONLY_ACTIVE_ARCH=NO \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
    
# Clean Archive Simulator SampleSDK
xcodebuild clean archive \
    -scheme SampleSDK \
    -configuration Debug \
    -destination 'generic/platform=iOS Simulator' \
    -archivePath './build/SampleSDK-iphonesimulator.xcarchive' \
    ONLY_ACTIVE_ARCH=NO \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework './build/SampleSDK-iphonesimulator.xcarchive/Products/Library/Frameworks/SampleSDK.framework' \
    -framework './build/SampleSDK-iphoneos.xcarchive/Products/Library/Frameworks/SampleSDK.framework' \
    -output './build/SampleSDK.xcframework'
