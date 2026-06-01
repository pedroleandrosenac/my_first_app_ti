import 'package:flutter/material.dart';
import 'package:my_first_app/routes/app_router.dart';
import 'models/candidate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App do Pedro',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.red)),
      routerConfig: AppRouter.router,
    );
  }
}
