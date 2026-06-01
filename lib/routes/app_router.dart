import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

import '../screens/home_screen.dart';
import '../screens/create_candidate_screen.dart';

class AppRouter {

  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) => const HomeScreen()
      ),

      GoRoute(
        path: AppRoutes.createCandidate,
        builder: (BuildContext context, GoRouterState state) => const CreateCandidateScreen()
      )
    ]
  );

}