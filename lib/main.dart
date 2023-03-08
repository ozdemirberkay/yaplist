import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/assets.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/shareds/locale/locale.dart';
import 'package:yaplist/shareds/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: Assets.translations,
      fallbackLocale: AppLocale.fallbackLocale,
      child: const YaplistApp(),
    ),
  );
}

class YaplistApp extends StatelessWidget {
  const YaplistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaplist',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: YaplistTheme.light,
      darkTheme: YaplistTheme.dark,
      themeMode: ThemeMode.light,
      routes: Routes.routes,
      initialRoute: Routes.initialScreen,
      // home: const DashboardScreeen(),
    );
  }
}
