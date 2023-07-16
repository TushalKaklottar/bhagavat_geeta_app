import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:bhagavat_geeta_app/controller/theme_provider.dart';
import 'package:bhagavat_geeta_app/view/screen/English_traslate.dart';
import 'package:bhagavat_geeta_app/view/screen/detail_page.dart';
import 'package:bhagavat_geeta_app/view/screen/home_screen.dart';
import 'package:bhagavat_geeta_app/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
        providers: [
          ListenableProvider(
            create: (context) => ThemeProvider(pref: pref),
  ),
          ListenableProvider(
              create: (context) => JSONProvider(),
          ),
        ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).getTheme ? ThemeMode.dark : ThemeMode.light,
      theme:  ThemeData(
        useMaterial3: true,
      ),
      // Dark Mode
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash_screen(),
        'home_screen': (context) => const Home_Page(),
        'detail_page' : (context) => const Detail_Page(),
        'gita_english': (context) => const Gita_English(),
      },
    );
  }
}