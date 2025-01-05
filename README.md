# mon_sms_pro

## Install the mon_sms_pro package from pub.dev:

```bash
flutter pub add mon_sms_pro
```

## Getting Started

For security reason it is useful to install the [`dotenv` package](https://pub.dev/packages/dotenv).

```bash
flutter pub add dotenv
```

After the installation, you need to create a `.env` file in the root of your Flutter project.

```bash
touch .env
```

Add the following lines to the `.env` file:

```bash
API_KEY="your_api_key"
```

import the environment variables:

```dart
import 'package:dotenv/dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
```

Create an instance of the MonSmsPro class:

```dart
final sms = MonSMSPRO(apiKey: dotenv.env['API_KEY'] ?? "");
```

Use the methods to send SMS:

```dart
import 'package:mon_sms_pro/mon_sms_pro.dart';

// GET OTP
ElevatedButton(
    onPressed: () async {
        final otp = await sms.otp.get(
            GetOtpPayload(phoneNumber: "+2250000000000"),
        );

        if (otp != null) {
            setState(() {
                _token = otp.token;
            });
        }
    },
    child: const Text("GET OTP"),
)
```

## Available methods

| Method       | Description                                              |
| ------------ | -------------------------------------------------------- |
| `otp.get`    | Generates an OTP and sends it to the user's phone number |
| `otp.verify` | Verifies a sent OTP                                      |

## License

The mon_sms_pro package is released under the [MIT License](https://opensource.org/licenses/MIT).
