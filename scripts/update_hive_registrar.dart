#!/usr/bin/env dart

import 'dart:io';

/// Script to automatically update Hive registrar files
/// Run with: dart scripts/update_hive_registrar.dart

void main() async {
  print('🔍 Scanning for Hive models...');

  final modelsDir = Directory('lib/models');
  final modelFiles = await _findModelFiles(modelsDir);

  print('📁 Found ${modelFiles.length} model files');

  final models = await _extractModels(modelFiles);
  print('📋 Found ${models.length} models');

  await _updateHiveRegistrar(models);
  await _updateInitHiveAdapters(models);

  print('✅ Hive registrar files updated successfully!');
  print('🔄 Run: dart run build_runner build --delete-conflicting-outputs');
}

Future<List<File>> _findModelFiles(Directory dir) async {
  final files = <File>[];

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File &&
        entity.path.endsWith('.dart') &&
        !entity.path.contains('.g.dart') &&
        !entity.path.contains('hive_registrar.dart') &&
        !entity.path.contains('init_hive_adapters.dart') &&
        !entity.path.contains('auto_hive_registrar.dart')) {
      files.add(entity);
    }
  }

  return files;
}

Future<List<ModelInfo>> _extractModels(List<File> files) async {
  final models = <ModelInfo>[];

  for (final file in files) {
    final content = await file.readAsString();
    final lines = content.split('\n');

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();

      // Look for enum definitions
      if (line.startsWith('enum ')) {
        final enumName = line.split(' ')[1].split('<')[0].split('{')[0];
        models.add(ModelInfo(
          name: enumName,
          file: file.path,
          isEnum: true,
        ));
      }

      // Look for class definitions that extend HiveObject or have @HiveType
      if (line.startsWith('class ') &&
          (line.contains('extends HiveObject') ||
              line.contains('@HiveType') ||
              content.contains('@HiveType'))) {
        final className = line.split(' ')[1].split('<')[0].split('{')[0];

        // Check if it's an enum
        final isEnum =
            line.contains('enum ') || content.contains('enum $className');

        models.add(ModelInfo(
          name: className,
          file: file.path,
          isEnum: isEnum,
        ));
      }
    }
  }

  return models;
}

Future<void> _updateHiveRegistrar(List<ModelInfo> models) async {
  final registrarFile = File('lib/models/hive_registrar.dart');

  // Generate imports with deduplication
  final importSet = <String>{};
  importSet.add("import 'package:hive_ce/hive.dart';");
  importSet.add("import 'package:mon_sms_pro/models/utils.dart';");

  for (final model in models) {
    final relativePath = model.file.replaceFirst('lib/', '');
    importSet.add("import 'package:mon_sms_pro/$relativePath';");
  }

  final imports = importSet.toList()..sort();
  imports.add("part 'hive_registrar.g.dart';");

  // Generate adapter specs
  final adapterSpecs = <String>[];

  // Add enums first
  for (final model in models.where((m) => m.isEnum)) {
    adapterSpecs.add("  AdapterSpec<${model.name}>(),");
  }

  // Add classes
  for (final model in models.where((m) => !m.isEnum)) {
    adapterSpecs.add("  AdapterSpec<${model.name}>(),");
  }

  // Generate new content
  final newContent = '''${imports.join('\n')}

@GenerateAdapters([
${adapterSpecs.join('\n')}
])
class HiveRegistrar {}
''';

  await registrarFile.writeAsString(newContent);
  print('📝 Updated hive_registrar.dart');
}

Future<void> _updateInitHiveAdapters(List<ModelInfo> models) async {
  final initFile = File('lib/models/init_hive_adapters.dart');

  final imports = <String>[];
  imports.add("import 'package:hive_ce_flutter/hive_flutter.dart';");
  imports.add("import 'package:mon_sms_pro/models/hive_registrar.dart';");

  final registrations = <String>[];

  // Add enum registrations first
  for (final model in models.where((m) => m.isEnum)) {
    registrations.add('''
  if (!Hive.isAdapterRegistered(${model.name}Adapter().typeId)) {
    Hive.registerAdapter(${model.name}Adapter());
  }''');
  }

  // Add class registrations
  for (final model in models.where((m) => !m.isEnum)) {
    registrations.add('''
  if (!Hive.isAdapterRegistered(${model.name}Adapter().typeId)) {
    Hive.registerAdapter(${model.name}Adapter());
  }''');
  }

  final newContent = '''${imports.join('\n')}

Future<void> initMonSMSProHiveAdapters() async {
  await Hive.initFlutter();

${registrations.join('\n')}
}
''';

  await initFile.writeAsString(newContent);
  print('📝 Updated init_hive_adapters.dart');
}

class ModelInfo {
  final String name;
  final String file;
  final bool isEnum;

  ModelInfo({
    required this.name,
    required this.file,
    required this.isEnum,
  });
}
