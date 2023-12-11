import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/enviroments.dart';
import 'package:templat_project/router/app_router.dart';
import 'constants/constant.dart';

void main() async {
  /* await Enviroment.initEnviroment(); */
  return runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      /* theme: appTheme.getTheme(), */
    );
  }
}
