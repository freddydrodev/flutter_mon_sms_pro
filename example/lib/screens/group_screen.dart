import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    super.initState();

    sms.group.list().then((value) {
      localDB.put("GROUPS", value.data ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Group"),
      ),
      body: ValueListenableBuilder(
        valueListenable: localDB.listenable(),
        builder: (context, box, _) {
          final groups = box.get("GROUPS") as List<GroupModel>?;

          if (groups == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (groups.isEmpty) {
            return const Center(
              child: Text("No groups found"),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final group = groups[index];
              return ListTile(
                title: Text(group.name),
                subtitle: Text(group.count.contacts.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
