import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './share.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const RootLayout(
            currentIndex: 0,
            body: HomeScreen(),
          );
        }),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        return const RootLayout(
          currentIndex: 1,
          body: DetailsScreen(),
        );
      },
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
