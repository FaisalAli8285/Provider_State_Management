import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/auth_provider.dart';
import 'package:state_manage/provider/count_provider.dart';
import 'package:state_manage/provider/example_one_provider.dart';
import 'package:state_manage/provider/fav_provider.dart';
import 'package:state_manage/provider/theme_changer_provider.dart';
import 'package:state_manage/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangeProvider>(context);
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.green),
                appBarTheme: AppBarTheme(color: Colors.deepOrange),
                primarySwatch: Colors.green),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              iconTheme: IconThemeData(color: Colors.amber),
              appBarTheme: AppBarTheme(color: Colors.teal),
            ),
            home: LoginScreen(),
          );
        }));
  }
}
