#!/bin/bash

# Pre-commit hook to automatically update Hive registrar files
# Install with: ln -s ../../scripts/pre_commit_hook.sh .git/hooks/pre-commit

echo "🔍 Pre-commit: Checking for model changes..."

# Check if any model files have changed
MODEL_CHANGES=$(git diff --cached --name-only | grep -E "lib/models/.*\.dart$" | grep -v "hive_registrar\.dart\|init_hive_adapters\.dart\|auto_hive_registrar\.dart")

if [ -n "$MODEL_CHANGES" ]; then
    echo "📝 Model files changed, updating Hive registrars..."

    # Update Hive registrar files
    dart scripts/update_hive_registrar.dart

    # Build adapters
    dart run build_runner build --delete-conflicting-outputs

    # Add the updated files to the commit
    git add lib/models/hive_registrar.dart
    git add lib/models/init_hive_adapters.dart
    git add lib/models/hive_registrar.g.dart
    git add lib/models/hive_registrar.g.yaml

    echo "✅ Hive registrars updated and added to commit"
else
    echo "✅ No model changes detected"
fi

exit 0
