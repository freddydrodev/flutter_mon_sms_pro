#!/usr/bin/env dart

import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Script to clear Hive database files
/// Run with: dart scripts/clear_hive_db.dart

void main() async {
  print('🧹 Clearing Hive database files...');

  try {
    // Get the application documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final hiveDir = Directory('${appDocDir.path}/hive');

    if (await hiveDir.exists()) {
      await hiveDir.delete(recursive: true);
      print('✅ Hive database directory cleared: ${hiveDir.path}');
    } else {
      print('ℹ️  Hive database directory not found: ${hiveDir.path}');
    }

    // Also clear any Hive boxes that might be in memory
    print(
        'ℹ️  Note: You may need to restart your app to clear in-memory Hive data');
  } catch (e) {
    print('❌ Error clearing Hive database: $e');
  }

  print('✅ Hive database cleanup completed!');
  print('🔄 Restart your app to use the new schema');
}
