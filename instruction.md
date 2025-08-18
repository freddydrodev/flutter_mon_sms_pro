# Hive Registrar Generation

To auto-generate the hive registrar files (`hive_registrar.g.dart` and `hive_registrar.g.yaml`), run:

```bash
dart run build_runner build --delete-conflicting-outputs --build-filter="lib/models/**"
```

This command will:

- Generate `lib/models/hive_registrar.g.dart` with all the Hive adapters
- Generate `lib/models/hive_registrar.g.yaml` with the type registry
- Only process files in the `lib/models/` directory to avoid conflicts with example files
- Delete any conflicting outputs to ensure clean generation

# Publishing

To publish the package:

```bash
dart pub publish
```
