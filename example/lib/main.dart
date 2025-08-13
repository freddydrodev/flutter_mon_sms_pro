import 'package:example/screens/auth_screen.dart';
import 'package:example/screens/contact_screen.dart';
import 'package:example/screens/group_screen.dart';
import 'package:example/screens/sender_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';
// import 'package:mon_sms_pro/models/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(
    "sms_example",
    HiveStorageBackendPreference.native,
    1,
  );

  await initHiveAdapters();

  await Hive.openBox('SMS_EXAMPLE');

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
      routes: {
        "/auth": (context) => const AuthScreen(),
        "/senders": (context) => const SenderScreen(),
        "/contacts": (context) => const ContactScreen(),
        "/groups": (context) => const GroupScreen(),
      },
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
  final routes = const [
    {
      "title": "Auth Screen",
      "route": "/auth",
    },
    {
      "title": "Sender Screen",
      "route": "/senders",
    },
    {
      "title": "Contact Screen",
      "route": "/contacts",
    },
    {
      "title": "Group Screen",
      "route": "/groups",
    },
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   localDB.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ...routes.map((route) => ListTile(
                title: Text(route["title"]!),
                onTap: () {
                  Navigator.pushNamed(context, route["route"]!);
                },
              )),
        ],
      ),
    );
  }
}
