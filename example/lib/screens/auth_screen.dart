import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? _token;

  final _otpController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Auth"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ElevatedButton(
            onPressed: () async {
              final otp = await sms.otp.get(
                GetOtpPayload(
                  phoneNumber: "+2250708517414",
                  senderId: dotenv.env['SENDER_ID'],
                ),
              );

              if (otp.success && otp.data != null) {
                setState(() {
                  _token = otp.data!.token;
                });
              }
            },
            child: const Text("GET OTP"),
          ),
          if (_token != null) ...[
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final val = _otpController.value.text;

                final otp = await sms.otp.verify(
                  VerifyOtpPayload(
                    token: _token!,
                    otp: val,
                    phoneNumber: "+2250708517414",
                  ),
                );

                if (otp.success) {
                  setState(() {
                    _token = null;
                  });

                  debugPrint("OTP VERIFIED");
                }
              },
              child: const Text("VERIFY OTP"),
            ),
          ],
          // ElevatedButton(
          //   onPressed: () async {
          //     final list = await sms.campaign.list(
          //       CampaignListPayload(senderId: "ID GOES HERE"),
          //     );

          //     localDB.put("CAMPAINS", list);

          //     print(list);
          //   },
          //   child: const Text("CAMPAINS LIST"),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final list = await sms.contact.list();

          //     print(list);
          //   },
          //   child: const Text("CONTACT LIST"),
          // ),
        ],
      ),
    );
  }
}
