# Hive CE Models

This directory contains all the Hive CE models for the Mon SMS Pro library. The models are organized using the new Hive CE `GenerateAdapters` approach.

## Structure

```
lib/models/
├── hive_registrar.dart          # Main adapter registration file
├── init_hive_adapters.dart      # Hive initialization function
├── hive_registrar.g.dart        # Generated adapters (auto-generated)
├── hive_registrar.g.yaml        # Hive schema (auto-generated)
├── models.dart                  # Model exports
├── utils.dart                   # Utility classes and enums
├── api_response_model.dart      # API response model
├── core/                        # Core models
├── campaign/                    # Campaign models
├── contact/                     # Contact models
├── group/                       # Group models
├── sender/                      # Sender models
├── template/                    # Template models
├── transaction/                 # Transaction models
└── lerezo/                      # Lerezo-specific models
```

## Setup

### 1. Dependencies

Make sure you have the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  hive_ce: ^2.11.3
  hive_ce_flutter: ^2.3.1

dev_dependencies:
  build_runner: ^2.6.0
  hive_ce_generator: ^1.9.3
```

### 2. Model Classes

All model classes extend `HiveObject` and don't require manual `@HiveType` or `@HiveField` annotations:

```dart
import 'package:hive_ce/hive.dart';

class UserModel extends HiveObject {
  final String? id;
  final String fullName;
  // ... other fields

  UserModel({
    this.id,
    required this.fullName,
    // ... other parameters
  });

  // ... fromJson and toJson methods
}
```

### 3. Adapter Registration

The `hive_registrar.dart` file contains the `@GenerateAdapters` annotation with all model classes:

```dart
import 'package:hive_ce/hive.dart';
// ... imports

@GenerateAdapters([
  AdapterSpec<Coords>(),
  AdapterSpec<Location>(),
  AdapterSpec<CampaignModel>(),
  // ... all other models
])
class HiveRegistrar {}
```

### 4. Initialization

Use the `initHiveAdapters()` function to initialize Hive in your Flutter app:

```dart
import 'package:mon_sms_pro/models/init_hive_adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive adapters
  await initHiveAdapters();

  // Open boxes as needed
  await Hive.openBox('myBox');

  runApp(MyApp());
}
```

## Best Practices

### 1. Model Organization

- Keep models organized by domain/feature
- Use clear, descriptive names
- Include proper `fromJson` and `toJson` methods
- Extend `HiveObject` for all model classes

### 2. Adapter Registration

- Use `@GenerateAdapters` with `AdapterSpec` for each model
- Keep all adapters in a single `hive_registrar.dart` file
- Run `dart run build_runner build` after adding new models

### 3. Initialization

- Use `Hive.initFlutter()` for Flutter apps
- Initialize adapters before opening any boxes
- Check if adapters are already registered to avoid conflicts

### 4. Usage

```dart
// Store objects
final user = UserModel(id: '1', fullName: 'John Doe');
await box.add(user);

// Retrieve objects
final users = box.values.toList();

// Update objects
user.fullName = 'Jane Doe';
await user.save();

// Delete objects
await user.delete();
```

## Generated Files

The following files are auto-generated and should be committed to version control:

- `hive_registrar.g.dart` - Contains all TypeAdapters
- `hive_registrar.g.yaml` - Contains the Hive schema for migrations

## Migration

When adding new fields to existing models:

1. Add the field to the model class
2. Update the `fromJson` and `toJson` methods
3. Run `dart run build_runner build`
4. The schema will be automatically updated

For more complex migrations, refer to the [Hive CE documentation](https://pub.dev/packages/hive_ce).

## References

- [Hive CE Documentation](https://pub.dev/packages/hive_ce)
- [Hive CE GitHub Repository](https://github.com/IO-Design-Team/hive_ce)
- [Migration Guide](https://pub.dev/packages/hive_ce#migration-guides)
