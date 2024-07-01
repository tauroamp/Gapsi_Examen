import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gapsi_app/view/home_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'binding/global_data_provider.dart';
import 'config/app_theme.dart';
import 'config/routes_configuration.dart';

void main() {
  runApp(const MyApp());
}

/* Requerido para obtener el contexto global en cualquier parte de la aplicación */
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalDataProvider()),
      ],
      child: GetMaterialApp(
        title: 'Gapsi Examen',
        navigatorKey: NavigationService.navigatorKey,
        theme: AppThemeData.lightThemeData,
        localizationsDelegates: const [
          //   S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        localeResolutionCallback: (
          locale,
          supportedLocales,
        ) {
          return locale;
        },
        home: const HomeView(),
      ),
    );
  }
}
