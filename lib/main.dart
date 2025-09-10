import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/shareds/bloc/settings_bloc/settings_bloc.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/shareds/constants/assets.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/shareds/locale/locale.dart';
import 'package:yaplist/shareds/theme/theme.dart';
import 'screens/unknown/unknown_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
          await getTemporaryDirectory().then((value) => value.path)));
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: Assets.translations,
      fallbackLocale: AppLocale.fallbackLocale,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TaskBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(),
          ),
        ],
        child: const YaplistApp(),
      ),
    ),
  );
}

class YaplistApp extends StatelessWidget {
  const YaplistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
            title: 'Yaplist',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: YaplistTheme.light,
            darkTheme: YaplistTheme.dark,
            themeMode: state.settings.themeMode,
            routes: Routes.routes,
            initialRoute: Routes.initialScreen,
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (BuildContext context) => const UnknownRoute());
            });
      },
    );
  }
}
