part of 'providers.dart';

final notificationNotifierProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>(
  (ref) => NotificationNotifier(),
);

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier() : super(NotificationState(message: 'no_message')) {
    _getAndSaveFCMToken();
    _onForegroundMessage();
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseFirestore firebaseDatabase = FirebaseFirestore.instance;
  void setNotification(String message) {
    state = state.copyWith(message: message);
  }

  void clearNotification() {
    state = state.copyWith(message: '');
  }

  Future initializeApp() async {
    late String? token;
    // Push Notifications
    await Firebase.initializeApp();
    /* await requestPermission(); */

    token = (await messaging.getToken());

    // Handlers
    /* FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp); */

    // Local Notifications
  }

  Future<String?> getToken() async {
    return await messaging.getToken();
  }

  void initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
  }

  void _getAndSaveFCMToken() async {
    final lastToken = await getToken();
    final localToken =
        await KeyValueStorageServiceImpl().getValue<String>('id_device_token');
    if (localToken != lastToken) {
      await KeyValueStorageServiceImpl()
          .setKeyValue<String>('id_device_token', lastToken!);
      await saveTokenInFirestore();
    }
  }

  Future<void> saveTokenInFirestore() async {
    final isThereToken =
        await KeyValueStorageServiceImpl().getValue<String>('id_device_token');
    final packageInfo = await PackageInfo.fromPlatform();

    final request = await Request.sendRequest(RequestType.post,
        '${Environment.serverToken}/notifications/saveDeviceId',
        body: {
          'token': isThereToken!,
          'packageName': packageInfo.packageName,
          'platform': Platform.operatingSystem
        });

    print(request); /*  */
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;
    print('onMessage: ${message.notification}');
    /* final notification = PushMessage(
      messageId: clearMessageId(message.messageId),
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification!.android?.imageUrl
          : message.notification!.apple?.imageUrl,
    ); */
    LocalNotification.showLocalNotification(
      id: message.hashCode,
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      /* data: message.notification.messageId, */
    );
    /* add(NotificationsReceived(notification)); */
  }
}

class NotificationState {
  final String message;

  NotificationState({
    required this.message,
  });

  NotificationState copyWith({
    String? message,
  }) {
    return NotificationState(
      message: message ?? this.message,
    );
  }
}
