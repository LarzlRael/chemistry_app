import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:templat_project/plugin/admob_plugin.dart';
import 'package:templat_project/plugin/local_notification.dart';
import 'package:templat_project/provider/providers.dart';
import 'package:templat_project/theme/theme.dart';
import 'firebase_options.dart';
import 'constants/enviroments.dart';
import 'package:templat_project/router/app_router.dart';
import 'constants/constant.dart';
import 'package:templat_project/services/firebase/remote_config.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Enviroment.initEnviroment();
  await LocalNotification.initializeLocalNotification();
  await AdmobPlugin.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseRemoteConfigService().initialize();
  return runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(notificationNotifierProvider);
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      /* theme: appTheme.getTheme(), */
      theme: AppTheme2(isDarkmode: true).getTheme(),
    );
  }
}
