import 'dart:convert';

import 'package:example/screens/campaign_screen.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

class SenderScreen extends StatefulWidget {
  const SenderScreen({super.key});

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  @override
  void initState() {
    super.initState();

    sms.sender.list().then((value) {
      localDB.put("SENDERS", value.data ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sender"),
      ),
      body: ValueListenableBuilder(
        valueListenable: localDB.listenable(),
        builder: (context, box, _) {
          final senders = box.get("SENDERS") as List<SenderModel>?;

          if (senders == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (senders.isEmpty) {
            return const Center(
              child: Text("No senders found"),
            );
          }

          print(jsonEncode({
            "id": "6887792841a1e6a39ee3a909",
            "text": "nouveau test",
            "isEnabled": true,
            "type": "SMS",
            "contactCount": 1,
            "creditUsed": 1,
            "createdAt": "2025-07-28T13:20:40.913Z",
            "_count": {"contacts": 0, "groups": 0},
            // to remove
            "name": "[SMS du 28/6/2025 à 13:20]",
            "coords": null,
            "contactList": null,
            "scheduledDate": null,
            "recurring": null,
            "user": {"fullName": "Compte Teste"},
            "sender": {"name": "Kolabo"},
          }));

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: senders.length,
            itemBuilder: (context, index) {
              final sender = senders[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CampaignScreen(senderId: sender.id),
                    ),
                  );
                },
                title: Text(sender.name),
                subtitle: Text(sender.createdAt.toString()),
                trailing: Text(sender.status.value),
              );
            },
          );
        },
      ),
    );
  }
}
