import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_card/pages/Scanpage.dart';
import 'package:virtual_card/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
    );
  }
}

final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Homepage.routername,
      name: Homepage.routername,
      builder: (context, state) => const Homepage(),
      routes: [
        GoRoute(
          path: Scanpage.routername,
          name: Scanpage.routername,
          builder: (context, state) => const Scanpage(),
        ),
      ],
    ),
  ],
);
