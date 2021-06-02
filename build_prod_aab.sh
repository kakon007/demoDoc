##!/bin/bash
set -e

# Find and increment the version number.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Commit and tag this change.
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`
#git tag $version -m "Version Upgraded to $version"
git commit -m "Version Upgraded to $version" pubspec.yaml

flutter build appbundle --flavor prod --target-platform android-arm,android-arm64,android-x64 --release --tree-shake-icons --split-debug-info --obfuscate -t lib/main.dart

#git push --tags