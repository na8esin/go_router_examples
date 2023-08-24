import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './share.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: RootLayout(
          currentIndex: 0,
          body: HomeScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/details',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: RootLayout(
          currentIndex: 1,
          body: DetailsScreen(),
        ),
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
