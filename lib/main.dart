import 'package:flutter/material.dart';
import 'pages/portfolio_page.dart';

final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.dark);

void main() {
  runApp(MyApp(themeMode: _themeMode));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Nwet Mon Aye - Portfolio',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF4F5F8),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pinkAccent,
              brightness: Brightness.light,
            ),
            fontFamily: 'Poppins',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF262626),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pinkAccent,
              brightness: Brightness.dark,
            ),
            fontFamily: 'Poppins',
          ),
          home: PortfolioPage(themeMode: themeMode),
        );
      },
    );
  }
}
