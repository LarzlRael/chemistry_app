import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:templat_project/utils/utils.dart';

class LocalNotification {
  static Future<void> requestPermissionLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      /* TODO ios config settings */
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static void showLocalNotification(
      {required int id, required String title, required String body}) async {
    final String iconPath =
        'https://res.cloudinary.com/negocioexitoso-online/image/upload/v1699626771/subastareas/icon_my26qq.png';

    final String largeIconPath =
        await downloadAndSaveFile(iconPath, 'largeIcon');
    final String bigPicturePath =
        await downloadAndSaveFile(iconPath, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      /* largeIcon: FilePathAndroidBitmap(largeIconPath), */
      hideExpandedLargeIcon: false,
      contentTitle: '<b>Attached Image</b>',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true,
    );

    final androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,

      /* TODO IOS */
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      /* payload: '${notification.idHomework}-${notification.type}', */
    );
  }

  static void onDidReceiveNotificationResponse(NotificationResponse response) {
    final getPayload = response.payload!.split('-');

    final notificaionId = int.parse(getPayload[0]);
    final notificaionType = getPayload[1];
    /* goNotificationDestinyPageWithAppRouter(notificaionId, notificaionType); */
  }
}
