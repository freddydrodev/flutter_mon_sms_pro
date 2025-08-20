import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();

    sms.contact.list().then((value) {
      localDB.put("CONTACTS", value.data ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contact"),
      ),
      body: ValueListenableBuilder(
        valueListenable: localDB.listenable(),
        builder: (context, box, _) {
          final contacts = box.get("CONTACTS") as List<ContactModel>?;

          if (contacts == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (contacts.isEmpty) {
            return const Center(
              child: Text("No contacts found"),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ListTile(
                title: Text(contact.name ?? ""),
                subtitle: Text(contact.phone),
                // trailing: Text(contact.createdAt.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
