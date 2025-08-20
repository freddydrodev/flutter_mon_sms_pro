# Mon SMS PRO - Development Instructions

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Setup & Installation](#setup--installation)
3. [Development Workflow](#development-workflow)
4. [Hive Database Management](#hive-database-management)
5. [API Integration](#api-integration)
6. [Testing](#testing)
7. [Building & Publishing](#building--publishing)
8. [Troubleshooting](#troubleshooting)

## 🎯 Project Overview

Mon SMS PRO is a Flutter library for sending SMS using the monsms.pro API. The project includes:

- **Core Library**: SMS sending functionality with Hive local storage
- **Example App**: Demonstrates library usage
- **Automated Hive Management**: Automatic adapter generation and registration
- **API Integration**: RESTful API client for monsms.pro services

### Key Features

- ✅ SMS Campaign Management
- ✅ Contact & Group Management
- ✅ Sender Management
- ✅ OTP Generation & Verification
- ✅ Local Data Storage with Hive
- ✅ Automated Code Generation

## 🚀 Setup & Installation

### Prerequisites

- Flutter SDK (>=1.17.0)
- Dart SDK (^3.5.4)
- Git

### 1. Clone the Repository

```bash
git clone https://github.com/freddydrodev/flutter_mon_sms_pro.git
cd flutter_mon_sms_pro
```

### 2. Install Dependencies

```bash
# Install main package dependencies
flutter pub get

# Install example app dependencies
cd example
flutter pub get
cd ..
```

### 3. Environment Setup

Create a `.env` file in the `example/` directory:

```bash
cd example
touch .env
```

Add your API credentials:

```env
SMS_API_KEY=your_api_key_here
BASE_URL=https://rest.monsms.pro/v1
```

### 4. Install Pre-commit Hook (Recommended)

```bash
# Install the pre-commit hook for automatic Hive updates
ln -s ../../scripts/pre_commit_hook.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## 🔧 Development Workflow

### 1. Starting Development

```bash
# Start the example app
cd example
flutter run

# Or run with specific device
flutter run -d chrome  # Web
flutter run -d ios     # iOS Simulator
flutter run -d android # Android Emulator
```

### 2. Code Generation

The project uses automated code generation for Hive adapters:

```bash
# Update Hive registrars and build adapters
make hive-full

# Or use individual commands:
make hive-update    # Update registrar files only
make hive-build     # Build adapters only
make hive-watch     # Watch for changes
make hive-clean     # Clean build cache
```

### 3. VS Code Integration

Use the built-in tasks for easy development:

- `Ctrl+Shift+P` → "Tasks: Run Task"
- Select "Hive: Full Update" for complete update
- Select "Hive: Watch & Build" for continuous watching

## 🗄️ Hive Database Management

### Automatic Updates

The project includes an automated system for managing Hive adapters:

#### Option 1: Pre-commit Hook (Recommended)

Automatically updates Hive files before each commit:

```bash
ln -s ../../scripts/pre_commit_hook.sh .git/hooks/pre-commit
```

#### Option 2: Manual Commands

```bash
make hive-full
```

#### Option 3: Watch Mode

```bash
make hive-watch
```

### Adding New Models

1. **Create your model** with `@HiveType` annotation:

```dart
@HiveType(typeId: 30) // Use next available typeId
class NewModel extends HiveObject {
  @HiveField(0)
  final String id;

  NewModel({required this.id});
}
```

2. **The system automatically detects it** when you:

   - Commit your changes (if pre-commit hook is installed)
   - Run `make hive-update`
   - Use VS Code task "Hive: Full Update"

3. **All Hive files are updated automatically**:
   - `hive_registrar.dart` - Adds imports and adapter specs
   - `init_hive_adapters.dart` - Adds registration calls
   - `hive_registrar.g.dart` - Generated adapters
   - `hive_registrar.g.yaml` - Type mapping

### Using Hive in Your App

```dart
import 'package:mon_sms_pro/models/init_hive_adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive adapters
  await initMonSMSProHiveAdapters();

  // Open boxes as needed
  await Hive.openBox('myBox');

  runApp(MyApp());
}
```

## 🔌 API Integration

### Basic Usage

```dart
import 'package:mon_sms_pro/mon_sms_pro.dart';

// Initialize the library
final sms = MonSMSPRO(
  apiKey: 'your_api_key',
  baseUrl: 'https://rest.monsms.pro/v1',
);

// Use different APIs
final campaigns = await sms.campaign.list();
final contacts = await sms.contact.list();
final senders = await sms.sender.list();
final groups = await sms.group.list();
final otp = await sms.otp.generate(phoneNumber: '+1234567890');
```

### Available APIs

- **Campaign API**: Manage SMS campaigns
- **Contact API**: Manage contacts
- **Group API**: Manage contact groups
- **Sender API**: Manage SMS senders
- **OTP API**: Generate and verify OTP codes

### Error Handling

```dart
try {
  final result = await sms.campaign.create(campaignData);
  print('Success: ${result.data}');
} catch (e) {
  print('Error: $e');
  // Handle error appropriately
}
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/mon_sms_pro_test.dart

# Run tests with coverage
flutter test --coverage
```

### Writing Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

void main() {
  group('MonSMSPRO', () {
    test('should initialize with API key', () {
      final sms = MonSMSPRO(apiKey: 'test_key');
      expect(sms, isNotNull);
    });

    test('should have all APIs available', () {
      final sms = MonSMSPRO(apiKey: 'test_key');
      expect(sms.campaign, isNotNull);
      expect(sms.contact, isNotNull);
      expect(sms.sender, isNotNull);
      expect(sms.group, isNotNull);
      expect(sms.otp, isNotNull);
    });
  });
}
```

## 📦 Building & Publishing

### 1. Building the Library

```bash
# Analyze the code
flutter analyze

# Run tests
flutter test

# Build the library
flutter build
```

### 2. Publishing to pub.dev

```bash
# Check if ready for publishing
dart pub publish --dry-run

# Publish the package
dart pub publish
```

### 3. Building the Example App

```bash
cd example

# Build for web
flutter build web

# Build for Android
flutter build apk

# Build for iOS
flutter build ios
```

### 4. Version Management

Update the version in `pubspec.yaml`:

```yaml
name: mon_sms_pro
version: 0.1.9 # Increment version
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Hive Adapter Errors

**Problem**: `TypeAdapter not found` errors

**Solution**:

```bash
# Clean and rebuild
make hive-clean
make hive-full
```

#### 2. Build Runner Issues

**Problem**: Build runner conflicts

**Solution**:

```bash
# Clean build cache
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs --build-filter="lib/models/**
```

#### 3. API Key Issues

**Problem**: Authentication errors

**Solution**:

- Verify API key in `.env` file
- Check API key permissions in monsms.pro dashboard
- Ensure base URL is correct

#### 4. Type ID Conflicts

**Problem**: Hive type ID conflicts

**Solution**:

1. Check `hive_registrar.g.yaml` for used type IDs
2. Use next available type ID in your model
3. Run `make hive-full`

### Debug Mode

Enable debug logging:

```dart
// In your app
void main() {
  // Enable debug mode
  debugPrint = (String? message, {int? wrapWidth}) {
    print('DEBUG: $message');
  };

  runApp(MyApp());
}
```

### Getting Help

1. **Check the documentation**: `docs/HIVE_AUTOMATION.md`
2. **Review example app**: `example/lib/`
3. **Check API documentation**: https://docs.monsms.pro
4. **Create an issue**: https://github.com/freddydrodev/flutter_mon_sms_pro/issues

## 📚 Additional Resources

- [Hive Automation Documentation](docs/HIVE_AUTOMATION.md)
- [API Documentation](https://docs.monsms.pro)
- [Flutter Documentation](https://docs.flutter.dev)
- [Hive CE Documentation](https://docs.hivedb.dev)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure they pass
5. Update documentation if needed
6. Submit a pull request

### Code Style

- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused
- Write tests for new features

---

**Happy Coding! 🚀**
