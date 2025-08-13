import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

class CampaignScreen extends StatefulWidget {
  final String senderId;
  const CampaignScreen({super.key, required this.senderId});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  @override
  void initState() {
    super.initState();

    sms.campaign.list(CampaignListPayload(senderId: widget.senderId)).then(
      (value) {
        localDB.put("CAMPAIGNS${widget.senderId}", value.data ?? []);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Campaign"),
      ),
      body: ValueListenableBuilder(
        valueListenable: localDB.listenable(),
        builder: (context, box, _) {
          final campaigns =
              box.get("CAMPAIGNS${widget.senderId}") as List<CampaignModel>?;

          if (campaigns == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (campaigns.isEmpty) {
            return const Center(
              child: Text("No campaigns found"),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: campaigns.length,
            itemBuilder: (context, index) {
              final campaign = campaigns[index];
              return ListTile(
                isThreeLine: true,
                title: Text(campaign.text),
                subtitle: Text(campaign.createdAt.toString()),
                trailing: Text(campaign.type.value),
              );
            },
          );
        },
      ),
    );
  }
}
