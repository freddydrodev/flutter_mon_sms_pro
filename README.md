# Mon SMS PRO - Flutter/Dart SDK

A comprehensive Flutter/Dart SDK for integrating with the Mon SMS PRO platform. Send bulk SMS, manage campaigns, contacts, and leverage gamification features.

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
  - [OTP API](#otp-api)
  - [User API](#user-api)
  - [Campaign API](#campaign-api)
  - [Contact API](#contact-api)
  - [Group API](#group-api)
  - [Sender API](#sender-api)
  - [Transaction API](#transaction-api)
  - [Offer API](#offer-api)
  - [Device API](#device-api)
  - [Company API](#company-api)
  - [AI API](#ai-api)
  - [Challenges API](#challenges-api)
  - [Daily Tasks API](#daily-tasks-api)
  - [Follower API](#follower-api)
- [Models](#models)
- [Enums](#enums)
- [Hive Database Management](#hive-database-management)

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mon_sms_pro: ^0.2.1
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:mon_sms_pro/mon_sms_pro.dart';

// Initialize the SDK with your API key
final monSmsPro = MonSMSPRO(apiKey: 'YOUR_API_KEY');

// Initialize Hive adapters (required for local storage)
await initHiveAdapters();

// Send an OTP
final otpResponse = await monSmsPro.otp.get(
  phoneNumber: '+2250700000000',
  length: 6,
  mode: 'NUMERIC',
);

// Get user details
final userResponse = await monSmsPro.user.details();

// Create a campaign
final campaignResponse = await monSmsPro.campaign.create(
  text: 'Hello from Mon SMS PRO!',
  senderId: 'your-sender-id',
  contacts: [ContactModel(phone: '+2250700000000')],
);
```

## API Reference

### OTP API

Authentication via One-Time Password.

```dart
final otpApi = monSmsPro.otp;
```

#### `get()` - Request OTP

Sends an OTP to a phone number.

```dart
final response = await otpApi.get(
  phoneNumber: '+2250700000000',  // Required
  senderId: 'MySender',           // Optional: Custom sender ID
  length: 6,                      // Optional: OTP length (default: 4)
  mode: 'NUMERIC',                // Optional: NUMERIC, ALPHABET, ALPHA_NUMERIC
  appName: 'MyApp',               // Optional: App name for SMS template
);

// Response
OTPModel(
  id: '...',
  token: 'verification-token',
  phoneNumber: '+2250700000000',
  status: OTPStatus.pending,
  mode: OTPMode.numeric,
)
```

#### `verify()` - Verify OTP

Verifies an OTP code.

```dart
final response = await otpApi.verify(
  token: 'verification-token',    // Required: Token from get()
  otp: '123456',                  // Required: OTP code entered by user
  phoneNumber: '+2250700000000',  // Optional
);

// Response
OTPModel(
  status: OTPStatus.verified,  // PENDING, VERIFIED, DEMO
)
```

---

### User API

User registration and management.

```dart
final userApi = monSmsPro.user;
```

#### `create()` - Register New User

```dart
final response = await userApi.create(
  emailAddress: 'user@example.com',   // Required
  phoneNumber: '+2250700000000',      // Required
  fullName: 'John Doe',               // Required
  otpToken: 'verification-token',     // Required: From OTP verification
  verificationId: 'verify-id',        // Required
  codePromo: 'PROMO2024',             // Optional: Promo code
);

// Response: UserModel
```

#### `details()` - Get Current User

```dart
final response = await userApi.details();

// Response
UserModel(
  id: '...',
  fullName: 'John Doe',
  emailAddress: 'user@example.com',
  phoneNumber: '+2250700000000',
  apiKey: '...',
  availableCredit: 100,
  isVerified: true,
  // ...
)
```

#### `credit()` - Get Available Credit

```dart
final response = await userApi.credit();

// Response: int (available SMS credits)
```

#### `get()` - Get User by Phone

```dart
final response = await userApi.get(
  phoneNumber: '+2250700000000',
  otpToken: 'verification-token',
);
```

#### `updateLogo()` - Update Profile Picture

```dart
final response = await userApi.updateLogo(
  logo: 'base64-encoded-image-or-url',
);
```

---

### Campaign API

SMS campaign management.

```dart
final campaignApi = monSmsPro.campaign;
```

#### `list()` - List Campaigns

```dart
final response = await campaignApi.list(
  senderId: 'sender-id',  // Required
);

// Response: List<CampaignModel>
```

#### `get()` - Get Campaign Details

```dart
final response = await campaignApi.get(
  id: 'campaign-id',
);

// Response: CampaignDetailsModel with contacts, groups, sender
```

#### `create()` - Create Campaign

```dart
final response = await campaignApi.create(
  text: 'Your SMS message here',           // Required
  senderId: 'sender-id',                   // Required
  name: 'Campaign Name',                   // Optional
  contacts: [                              // Optional
    ContactModel(phone: '+2250700000000'),
    ContactModel(phone: '+2250700000001'),
  ],
  groupsIds: ['group-id-1', 'group-id-2'], // Optional
  type: SMSType.sms,                       // Optional: SMS, FLASH, SCHEDULED, RECURRING
  scheduledDate: DateTime.now().add(Duration(hours: 1)),  // Optional
  recurring: CampaignRecurringDayModel(    // Optional: For recurring campaigns
    enabled: true,
    monday: DateTime.parse('2024-01-01 09:00:00'),
    // ...
  ),
);
```

#### `update()` - Update Campaign

```dart
final response = await campaignApi.update(
  id: 'campaign-id',
  scheduledDate: DateTime.now().add(Duration(days: 1)),
  recurring: CampaignRecurringDayModel(...),
);
```

#### `toggleEnable()` - Enable/Disable Campaign

```dart
final response = await campaignApi.toggleEnable(
  id: 'campaign-id',
);
```

---

### Contact API

Contact management.

```dart
final contactApi = monSmsPro.contact;
```

#### `list()` - List Contacts

```dart
final response = await contactApi.list(
  count: 20,          // Optional: Items per page
  page: 1,            // Optional: Page number
  sort: SortList.desc, // Optional: asc or desc
  orderBy: 'createdAt', // Optional
);

// Response: List<ContactModel>
```

#### `create()` - Create Contacts

```dart
final response = await contactApi.create(
  contacts: [
    ContactModel(
      phone: '+2250700000000',
      name: 'John Doe',
      firstName: 'John',
      lastName: 'Doe',
      sex: SexType.m,
    ),
    ContactModel(phone: '+2250700000001', name: 'Jane Doe'),
  ],
);
```

#### `get()` - Get Contact

```dart
final response = await contactApi.get(id: 'contact-id');
```

#### `update()` - Update Contact

```dart
final response = await contactApi.update(
  id: 'contact-id',
  phone: '+2250700000000',
  name: 'Updated Name',
  firstName: 'John',
  lastName: 'Doe',
  sex: SexType.m,
);
```

#### `delete()` - Delete Contacts

```dart
final response = await contactApi.delete(
  contactIds: ['contact-id-1', 'contact-id-2'],
);
```

---

### Group API

Contact group management.

```dart
final groupApi = monSmsPro.group;
```

#### `list()` - List Groups

```dart
final response = await groupApi.list(
  count: 20,
  page: 1,
  sort: SortList.desc,
  orderBy: 'createdAt',
);

// Response: List<GroupModel>
```

#### `create()` - Create Group

```dart
final response = await groupApi.create(
  name: 'VIP Customers',
  contacts: [
    ContactModel(phone: '+2250700000000', name: 'John'),
    ContactModel(phone: '+2250700000001', name: 'Jane'),
  ],
);
```

#### `get()` - Get Group

```dart
final response = await groupApi.get(id: 'group-id');
```

#### `update()` - Update Group

```dart
final response = await groupApi.update(
  id: 'group-id',
  name: 'Updated Group Name',
  contacts: [...],
);
```

#### `delete()` - Delete Group

```dart
final response = await groupApi.delete(id: 'group-id');
```

---

### Sender API

Sender ID management.

```dart
final senderApi = monSmsPro.sender;
```

#### `list()` - List Senders

```dart
final response = await senderApi.list(
  count: 20,
  page: 1,
);

// Response: List<SenderModel>
```

#### `create()` - Create Sender

```dart
final response = await senderApi.create(
  name: 'MySender',           // Required: Max 11 characters
  description: 'My business', // Required
);

// Note: Sender requires approval before use
// Status: PENDING -> SUBMITED -> ACCEPTED/REFUSED
```

#### `get()` - Get Sender

```dart
final response = await senderApi.get(id: 'sender-id');
```

#### `update()` - Archive/Restore Sender

```dart
final response = await senderApi.update(
  id: 'sender-id',
  archived: true,  // Archive the sender
);
```

---

### Transaction API

Payment and transaction management.

```dart
final transactionApi = monSmsPro.transaction;
```

#### `list()` - List Transactions

```dart
final response = await transactionApi.list(
  count: 20,
  page: 1,
  companyId: 'company-id',  // Optional
);

// Response: List<TransactionModel>
```

#### `create()` - Create Transaction

```dart
final response = await transactionApi.create(
  offerId: 'offer-id',
  paymentMethod: PaymentMethod.omCi,  // OM_CI, MTN_CI, MOOV_CI, WAVE_CI, etc.
  companyId: 'company-id',            // Optional
);
```

#### `check()` - Check Transaction Status

```dart
final response = await transactionApi.check(id: 'transaction-id');

// Response
TransactionModel(
  status: TransactionStatus.charged,  // PENDING, FAILED, CHARGED
  credit: 100,
  price: 5000,
)
```

#### `update()` - Update Transaction

```dart
final response = await transactionApi.update(
  id: 'transaction-id',
  status: TransactionStatus.charged,
);
```

---

### Offer API

Credit offers/packages.

```dart
final offerApi = monSmsPro.offer;
```

#### `list()` - List Offers

```dart
final response = await offerApi.list();

// Response: List<OfferModel>
// Offers: STARTER, BRONZE, FER, OR, DIAMANT, VIP
```

#### `get()` - Get Offer

```dart
final response = await offerApi.get(id: 'offer-id');

// Response
OfferModel(
  id: '...',
  name: OfferName.bronze,
  price: 5000,    // Price in XOF
  credit: 100,    // SMS credits
)
```

---

### Device API

Device registration and management.

```dart
final deviceApi = monSmsPro.device;
```

#### `get()` - Get Device

```dart
final response = await deviceApi.get(
  deviceId: 'unique-device-id',
);
```

#### `register()` - Register Device

```dart
final response = await deviceApi.register(
  deviceId: 'unique-device-id',
  type: DeviceType.android,           // ANDROID, IOS, WEB
  notificationToken: 'fcm-token',     // Optional: For push notifications
  companyId: 'company-id',            // Optional
);
```

#### `updateToken()` - Update Notification Token

```dart
final response = await deviceApi.updateToken(
  deviceId: 'unique-device-id',
  notificationToken: 'new-fcm-token',
);
```

#### `delete()` - Delete Device

```dart
final response = await deviceApi.delete(id: 'device-id');
```

---

### Company API

Company/business management.

```dart
final companyApi = monSmsPro.company;
```

#### `list()` - List User's Companies

```dart
final response = await companyApi.list();

// Response: List<CompanyModel>
```

#### `listTypes()` - List Company Types

```dart
final response = await companyApi.listTypes();

// Response: List<CompanyTypeModel>
```

#### `get()` - Get Company

```dart
final response = await companyApi.get(id: 'company-id');

// Response
CompanyModel(
  id: '...',
  name: 'My Business',
  verificationStatus: CompanyVerificationStatus.approved,
)
```

#### `create()` - Create Company

```dart
final response = await companyApi.create(
  name: 'My Business',
  companyTypeId: 'type-id',
  description: 'Business description',  // Optional
  logo: 'base64-or-url',                // Optional
  address: '123 Main St',               // Optional
  city: 'Abidjan',                      // Optional
);
```

#### `update()` - Update Company

```dart
final response = await companyApi.update(
  id: 'company-id',
  name: 'Updated Name',
  description: 'New description',
);
```

---

### AI API

AI-powered message optimization and URL shortening.

```dart
final aiApi = monSmsPro.ai;
```

#### `shortenUrl()` - Shorten URLs in Message

```dart
final response = await aiApi.shortenUrl(
  message: 'Check out https://example.com/very/long/url',
);

// Response
AIUrlResponse(
  original: 'Check out https://example.com/very/long/url',
  processed: 'Check out https://short.url/abc',
)
```

#### `optimizeMessage()` - AI Message Optimization

Uses AI to optimize SMS messages for length and clarity.

```dart
final response = await aiApi.optimizeMessage(
  message: 'Your long message here...',
  language: 'fr',           // Target language
  abbreviation: true,       // Optional: Use abbreviations
  latinize: true,           // Optional: Remove accents
);

// Response: String (optimized message)
```

#### `processMessage()` - Process Message (Legacy)

```dart
final response = await aiApi.processMessage(
  message: 'Message with URLs',
);
```

---

### Challenges API

Gamification challenges system.

```dart
final challengesApi = monSmsPro.challenges;
```

#### `list()` - List Challenges

```dart
final response = await challengesApi.list(
  companyId: 'company-id',
  type: ChallengeType.weekly,     // Optional: WEEKLY, MONTHLY, SPECIAL
  status: ChallengeStatus.active, // Optional: UPCOMING, ACTIVE, ENDED
);

// Response: List<ChallengeModel>
```

#### `get()` - Get Challenge Details

```dart
final response = await challengesApi.get(
  id: 'challenge-id',
  companyId: 'company-id',
);

// Response
ChallengeModel(
  id: '...',
  name: 'Weekly Challenge',
  type: ChallengeType.weekly,
  status: ChallengeStatus.active,
  startDate: DateTime(...),
  endDate: DateTime(...),
  tasks: [...],
  communityRewards: [...],
  isJoined: true,
  userXp: 500,
  userRank: 3,
)
```

#### `join()` - Join Challenge

```dart
final response = await challengesApi.join(
  id: 'challenge-id',
  companyId: 'company-id',
);
```

#### `leave()` - Leave Challenge

```dart
final response = await challengesApi.leave(
  id: 'challenge-id',
  companyId: 'company-id',
);
```

#### `leaderboard()` - Get Leaderboard

```dart
final response = await challengesApi.leaderboard(
  id: 'challenge-id',
  companyId: 'company-id',
);

// Response: List<ChallengeLeaderboardEntryModel>
```

#### `claimTask()` - Claim Task Reward

```dart
final response = await challengesApi.claimTask(
  id: 'challenge-id',
  taskKey: 'send_100_sms',
  companyId: 'company-id',
);
```

#### `claimReward()` - Claim Community Reward

```dart
final response = await challengesApi.claimReward(
  id: 'challenge-id',
  rewardIndex: 0,
  companyId: 'company-id',
);
```

---

### Daily Tasks API

Daily gamification tasks.

```dart
final dailyTasksApi = monSmsPro.dailyTasks;
```

#### `list()` - List Today's Tasks

```dart
final response = await dailyTasksApi.list(
  companyId: 'company-id',
);

// Response: List<DailyTaskModel>
// Task types: SMS_SENT, SMS_DELIVERED, CONTACTS_ADDED, etc.
```

#### `claim()` - Claim Task Reward

```dart
final response = await dailyTasksApi.claim(
  taskKey: 'send_10_sms',
  companyId: 'company-id',
);

// Response: int (XP claimed)
```

#### `getProfile()` - Get Game Profile

```dart
final response = await dailyTasksApi.getProfile(
  companyId: 'company-id',
);

// Response
GameProfileModel(
  totalXp: 1500,
  level: 5,
  currentLevelXp: 300,
  xpToNextLevel: 500,
  streak: 7,
)
```

#### `claimBonus()` - Claim All-Tasks Bonus

```dart
final response = await dailyTasksApi.claimBonus(
  companyId: 'company-id',
);

// Response: int (bonus XP)
```

---

### Follower API

Le Rezo subscription/follower management.

```dart
final followerApi = monSmsPro.follower;
```

#### `get()` - Get Follower

```dart
final response = await followerApi.get(id: 'follower-id');
```

#### `getByPhone()` - Get Follower by Phone

```dart
final response = await followerApi.getByPhone(
  phoneNumber: '+2250700000000',
);
```

#### `update()` - Update Follower

```dart
final response = await followerApi.update(
  id: 'follower-id',
  name: 'New Name',
);
```

#### `updateLogo()` - Update Follower Photo

```dart
final response = await followerApi.updateLogo(
  id: 'follower-id',
  logo: 'base64-or-url',
);
```

#### `following()` - List Followed Companies

```dart
final response = await followerApi.following(
  id: 'follower-id',
);

// Response: List<CompanyFollowedModel>
```

#### `subscribe()` - Subscribe to Company

```dart
final response = await followerApi.subscribe(
  id: 'follower-id',
  companyId: 'company-id',
);
```

#### `unsubscribe()` - Unsubscribe from Company

```dart
final response = await followerApi.unsubscribe(
  id: 'follower-id',
  companyId: 'company-id',
);
```

#### `getCompanyCampaigns()` - Get Company's Campaigns

```dart
final response = await followerApi.getCompanyCampaigns(
  id: 'follower-id',
  companyId: 'company-id',
);
```

---

## Models

### Core Models

| Model | Description |
|-------|-------------|
| `UserModel` | User profile with credits, verification status |
| `OTPModel` | OTP token with status and mode |
| `OfferModel` | Credit package with price and credits |
| `VersionModel` | App version information |

### Campaign Models

| Model | Description |
|-------|-------------|
| `CampaignModel` | SMS campaign with stats |
| `CampaignDetailsModel` | Full campaign with contacts, groups, sender |
| `CampaignCountModel` | Contact and group counts |
| `CampaignRecurringDayModel` | Recurring schedule configuration |

### Contact & Group Models

| Model | Description |
|-------|-------------|
| `ContactModel` | Contact with phone, name, sex |
| `GroupModel` | Contact group with members |
| `GroupCountModel` | Contact count in group |

### Company Models

| Model | Description |
|-------|-------------|
| `CompanyModel` | Business/company profile |
| `CompanyTypeModel` | Company category type |
| `VerifyIdModel` | KYC verification record |

### Transaction Models

| Model | Description |
|-------|-------------|
| `TransactionModel` | Payment transaction |
| `SenderModel` | Sender ID with approval status |
| `DeviceModel` | Registered device |

### Gamification Models

| Model | Description |
|-------|-------------|
| `ChallengeModel` | Challenge with tasks and rewards |
| `ChallengeTaskModel` | Individual challenge task |
| `ChallengeRewardModel` | Community reward |
| `ChallengeLeaderboardEntryModel` | Leaderboard entry |
| `DailyTaskModel` | Daily task with progress |
| `GameProfileModel` | User XP, level, streak |

### Le Rezo Models

| Model | Description |
|-------|-------------|
| `FollowerModel` | Subscriber/follower profile |
| `CompanyFollowedModel` | Company subscription |

---

## Enums

### SMS & Campaign Types

```dart
enum SMSType { sms, flash, scheduled, recurring }
enum SmsType { promotional, transactional, otp }  // For sender types
```

### Status Enums

```dart
enum OTPStatus { pending, verified, demo }
enum OTPMode { numeric, alphabet, alphaNumeric }
enum SenderStatus { pending, submited, accepted, refused }
enum TransactionStatus { pending, failed, charged }
enum TransactionType { debited, recharged }
enum VerifyIdStatus { pending, verified, approved, refused }
enum CompanyVerificationStatus { pending, approved, refused }
```

### Gamification Enums

```dart
enum ChallengeType { weekly, monthly, special }
enum ChallengeStatus { upcoming, active, ended }
enum DailyTaskCriteriaType {
  smsSent, smsDelivered, contactsAdded,
  campaignsCreated, groupsCreated, appOpened, creditPurchased
}
```

### Other Enums

```dart
enum PaymentMethod { omCi, mtnCi, moovCi, waveCi, cash, iap, builtIn, otp }
enum DeviceType { android, ios, web }
enum OfferName { starter, bronze, fer, or, diamant, vip }
enum SexType { m, f }
enum Country { ci }
enum TransactionPeriod { year, month, week, day, none }
```

---

## Hive Database Management

This SDK uses Hive for local data caching.

### Initialize Hive

```dart
import 'package:mon_sms_pro/mon_sms_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveAdapters();
  runApp(MyApp());
}
```

### Quick Commands

```bash
# Update Hive registrars and build adapters
make hive-full

# Watch for changes
make hive-watch

# Clean build cache
make hive-clean
```

### Regenerate Adapters

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Error Handling

All API methods return `ApiResponseModel<T>`:

```dart
final response = await monSmsPro.user.details();

if (response.success) {
  final user = response.data;
  print('User: ${user?.fullName}');
} else {
  print('Error: ${response.error}');
}
```

---

## API Key

Get your API key from the [Mon SMS PRO app](https://onelink.to/kg2z8q) in Settings.

---

## Documentation

Visit [docs.monsms.pro](https://docs.monsms.pro/libs/dart/get-started) for more information.

---

## Support

For issues and feature requests, visit our [GitHub repository](https://github.com/anthropics/claude-code/issues).

---

## License

MIT License - see LICENSE file for details.
