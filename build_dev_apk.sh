#!/bin/bash
set -e

# Increase the version number
perl -i -pe 's/^(version:\s+\d+\.\d+\.)(\d+)(\+)(\d+)$/$1.($2+1).$3.($4+1)/e' pubspec.yaml

# Commit the changed version
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`
git commit -m "Version Upgraded to $version" pubspec.yaml

#flutter build apk  --flavor dev  --debug
#flutter build apk  --flavor dev  --profile
#flutter build apk  --flavor dev --release
#flutter build apk  --flavor dev --target-platform android-arm,android-arm64 --release
flutter build apk  --flavor dev --target-platform android-arm,android-arm64 --release --tree-shake-icons --split-debug-info --obfuscate -t lib/main.dart
