import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootLayout extends StatelessWidget {
  /// Constructs a [RootLayout]
  const RootLayout(
      {super.key,
      required this.body,
      required this.currentIndex,
      required this.title});

  final int currentIndex;
  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      key: const ValueKey('RootLayout'),
      body: body,
      bottomNavigationBar: NavigationBar(
        destinations: _destinations,
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          // 下２行は結構無理やりなコード
          // 商用のコードでは、NavigationDestinationを拡張した方がいいのかもしれない
          final key = _destinations[index].key as ValueKey<String>;
          final path = "/${key.value.toString().toLowerCase()}";
          context.go(path);
        },
      ),
    );
  }
}

const List<NavigationDestination> _destinations = [
  NavigationDestination(
    key: ValueKey(''),
    label: 'ホーム',
    icon: Icon(Icons.home_outlined),
  ),
  NavigationDestination(
    key: ValueKey('Details'),
    label: '詳細',
    icon: Icon(Icons.playlist_add_check),
  ),
];

class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Details Screen'));
  }
}
