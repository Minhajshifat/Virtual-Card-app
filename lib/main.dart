import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_card/models/contactmodel.dart';
import 'package:virtual_card/pages/Scanpage.dart';
import 'package:virtual_card/pages/contactform.dart';
import 'package:virtual_card/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: EasyLoading.init(),
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
          routes: [
            GoRoute(
              path: Contactform.routername,
              name: Contactform.routername,
              builder: (context, state) =>
                  Contactform(contactinfo: state.extra! as Contactmodel),
            ),
          ],
        ),
      ],
    ),
  ],
);
