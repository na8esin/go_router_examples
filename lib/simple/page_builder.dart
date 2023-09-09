import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './share.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          title: 'home screen',
          key: _scaffoldKey,
          currentIndex: 0,
          body: HomeScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/details',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          title: 'detail screen',
          key: _scaffoldKey,
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

class HomePage extends MaterialPage<HomeScreen> {
  const HomePage({required super.child});
}
