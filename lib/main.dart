import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:templat_project/provider/providers.dart';
import 'package:templat_project/router/app_router.dart';
import 'constants/constant.dart';
import 'constants/enviroments.dart';

void main() async {
  /* await Enviroment.initEnviroment(); */
  return runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProviderNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeProviderNotifier>(context).appTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CompoundsProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: appTheme.getTheme(),
      ),
    );
  }
}
