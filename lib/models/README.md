# Hive CE Models

This directory contains all the Hive CE models for the Mon SMS Pro library. The models are organized using the new Hive CE `GenerateAdapters` approach.

## Structure

```
lib/models/
├── hive_registrar.dart          # Main adapter registration file
├── init_hive_adapters.dart      # Hive initialization function
├── hive_registrar.g.dart        # Generated adapters (auto-generated)
├── hive_registrar.g.yaml        # Hive schema (auto-generated)
├── README.md                    # This documentation
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

### 3. Enum Classes

All enum classes are automatically handled by Hive CE and don't require manual annotations:

```dart
enum SenderStatus {
  pending("PENDING"),
  submited("SUBMITED"),
  accepted("ACCEPTED"),
  refused("REFUSED");

  const SenderStatus(this.value);
  final String value;

  static SenderStatus fromValue(String value) {
    return SenderStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => throw ArgumentError('No enum value with that value: $value'),
    );
  }
}
```

### 4. Adapter Registration

The `hive_registrar.dart` file contains the `@GenerateAdapters` annotation with all model classes and enums:

```dart
import 'package:hive_ce/hive.dart';
// ... imports

@GenerateAdapters([
  // Enums
  AdapterSpec<SMSType>(),
  AdapterSpec<SexType>(),
  AdapterSpec<Country>(),
  AdapterSpec<TransactionType>(),
  AdapterSpec<TransactionStatus>(),
  AdapterSpec<PaymentMethod>(),
  AdapterSpec<OfferName>(),
  AdapterSpec<OTPStatus>(),
  AdapterSpec<SenderStatus>(),

  // Classes
  AdapterSpec<Coords>(),
  AdapterSpec<Location>(),
  AdapterSpec<CampaignModel>(),
  // ... all other models
])
class HiveRegistrar {}
```

### 5. Initialization

Use the `initHiveAdapters()` function to initialize Hive in your Flutter app:

```dart
import 'package:mon_sms_pro/models/init_hive_adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive adapters (includes both enums and classes)
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

### 2. Enum Handling

- **IMPORTANT**: All enums used in model classes must be registered as adapters
- Enums are automatically generated with sequential type IDs
- No manual `@HiveType` or `@HiveField` annotations needed
- Include enums in the `@GenerateAdapters` annotation

### 3. Adapter Registration

- Use `@GenerateAdapters` with `AdapterSpec` for each model and enum
- Keep all adapters in a single `hive_registrar.dart` file
- Register enum adapters before class adapters in `init_hive_adapters.dart`
- Run `dart run build_runner build` after adding new models or enums

### 4. Initialization

- Use `Hive.initFlutter()` for Flutter apps
- Initialize adapters before opening any boxes
- Check if adapters are already registered to avoid conflicts

### 5. Usage

```dart
// Store objects with enum fields
final sender = SenderModel(
  id: '1',
  name: 'Test Sender',
  status: SenderStatus.pending, // Enum is automatically serialized
  createdAt: DateTime.now(),
);
await box.add(sender);

// Retrieve objects
final senders = box.values.toList();

// Update objects
sender.status = SenderStatus.accepted; // Enum changes are handled automatically
await sender.save();

// Delete objects
await sender.delete();
```

## Generated Files

The following files are auto-generated and should be committed to version control:

- `hive_registrar.g.dart` - Contains all TypeAdapters (both enums and classes)
- `hive_registrar.g.yaml` - Contains the Hive schema for migrations

## Complete Adapter List

### Enum Adapters (Type IDs 19-27)

- `SMSTypeAdapter` (typeId: 19)
- `SexTypeAdapter` (typeId: 20)
- `CountryAdapter` (typeId: 21)
- `TransactionTypeAdapter` (typeId: 22)
- `TransactionStatusAdapter` (typeId: 23)
- `PaymentMethodAdapter` (typeId: 24)
- `OfferNameAdapter` (typeId: 25)
- `OTPStatusAdapter` (typeId: 26)
- `SenderStatusAdapter` (typeId: 27)

### Class Adapters (Type IDs 0-18)

- `CoordsAdapter` (typeId: 0)
- `LocationAdapter` (typeId: 1)
- `CampaignModelAdapter` (typeId: 2)
- `CampaignCountModelAdapter` (typeId: 3)
- `CampaignRecurringDayModelAdapter` (typeId: 4)
- `ContactModelAdapter` (typeId: 5)
- `ImportModelAdapter` (typeId: 6)
- `OfferModelAdapter` (typeId: 7)
- `OTPModelAdapter` (typeId: 8)
- `UserModelAdapter` (typeId: 9)
- `VersionModelAdapter` (typeId: 10)
- `GroupModelAdapter` (typeId: 11)
- `GroupCountModelAdapter` (typeId: 12)
- `CompanyFollowedModelAdapter` (typeId: 13)
- `CompanyTypeModelAdapter` (typeId: 14)
- `FollowerModelAdapter` (typeId: 15)
- `SenderModelAdapter` (typeId: 16)
- `TemplateModelAdapter` (typeId: 17)
- `TransactionModelAdapter` (typeId: 18)

## Migration

When adding new fields to existing models:

1. Add the field to the model class
2. Update the `fromJson` and `toJson` methods
3. Run `dart run build_runner build`
4. The schema will be automatically updated

For more complex migrations, refer to the [Hive CE documentation](https://pub.dev/packages/hive_ce).

## Troubleshooting

### Common Issues

1. **"Cannot write, unknown type: EnumName"**

   - Make sure the enum is included in `@GenerateAdapters`
   - Ensure the enum adapter is registered in `init_hive_adapters.dart`
   - Run `dart run build_runner build` to regenerate adapters

2. **"Cannot write, unknown type: ModelName"**

   - Make sure the model class extends `HiveObject`
   - Ensure the model is included in `@GenerateAdapters`
   - Check that the adapter is registered in `init_hive_adapters.dart`

3. **Build errors**
   - Clean and rebuild: `dart run build_runner clean && dart run build_runner build`
   - Check for syntax errors in model classes
   - Ensure all imports are correct

## References

- [Hive CE Documentation](https://pub.dev/packages/hive_ce)
- [Hive CE GitHub Repository](https://github.com/IO-Design-Team/hive_ce)
- [Migration Guide](https://pub.dev/packages/hive_ce#migration-guides)
