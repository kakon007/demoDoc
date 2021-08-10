##!/bin/bash
set -e

# Find and increment the version number.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Commit and tag this change.
version=`grep 'version: 1' pubspec.yaml | sed 's/version: //'`
git commit -m "Version Upgraded to $version" pubspec.yaml
#git tag $version

flutter build ios --release --tree-shake-icons --split-debug-info --obfuscate -t lib/main_prod.dart
