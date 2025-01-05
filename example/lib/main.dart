import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mon SMS Pro Library Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _token;

  // TODO: ADD SMS_API_KEY TO .env file
  final sms = MonSMSPRO(apiKey: dotenv.env['SMS_API_KEY'] ?? "");

  final _otpController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ElevatedButton(
            onPressed: () async {
              final otp = await sms.otp.get(
                GetOtpPayload(phoneNumber: "+2250708517414"),
              );

              if (otp != null) {
                setState(() {
                  _token = otp.token;
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
                  VerifyOtpPayload(token: _token!, otp: val),
                );

                if (otp != null) {
                  setState(() {
                    _token = null;
                  });

                  print("OTP VERIFIED");
                }
              },
              child: const Text("VERIFY OTP"),
            ),
          ],
          ElevatedButton(
            onPressed: () async {
              final list = await sms.campain.list();

              print(list);
            },
            child: const Text("CAMPAINS LIST"),
          ),
          ElevatedButton(
            onPressed: () async {
              final list = await sms.contact.list();

              print(list);
            },
            child: const Text("CONTACT LIST"),
          ),
        ],
      ),
    );
  }
}
