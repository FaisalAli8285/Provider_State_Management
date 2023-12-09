import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manage/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Subscribe")),
      ),
      body: Column(
        children: [
          // GestureDetector(
          //   onTap: () => themeChanger.setTheme(ThemeMode.light),
          //   child: RadioListTile<ThemeMode>(
          //     title: Text("Light Mode"),
          //     value: ThemeMode.light,
          //     groupValue: themeChanger.themeMode,
          //     onChanged: themeChanger.setTheme,
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () => themeChanger.setTheme(ThemeMode.dark),
          //   child: RadioListTile<ThemeMode>(
          //     title: Text("Dark Mode"),
          //     value: ThemeMode.dark,
          //     groupValue: themeChanger.themeMode,
          //     onChanged: themeChanger.setTheme,
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () => themeChanger.setTheme(ThemeMode.system),
          //   child: RadioListTile<ThemeMode>(
          //     title: Text("System Mode"),
          //     value: ThemeMode.system,
          //     groupValue: themeChanger.themeMode,
          //     onChanged: themeChanger.setTheme,
          //   ),
          // ),
          RadioListTile<ThemeMode>(
              title: Text("Dark Theme"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("Light Theme"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
              Icon(Icons.favorite),
          RadioListTile<ThemeMode>(
              title: Text("System Theme"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
