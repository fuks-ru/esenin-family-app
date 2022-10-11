import 'package:built_collection/built_collection.dart';
import 'package:esenin_family/app/lib/app_route.dart';
import 'package:esenin_family/entities/pub/pub.dart';
import 'package:esenin_family/pages/event_poster/event_poster.dart';
import 'package:esenin_family_client/esenin_family_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      FutureProvider<BuiltList<Pub>>(
          create: (_) => PubModel().getList(), initialData: BuiltList<Pub>([]))
    ], child: const App()));

class App extends StatelessWidget {
  const App({super.key});

  static const String _title = 'Esenin family';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const AppRouter(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.dark(
          secondaryContainer: Colors.blueGrey.shade700,
          onSecondaryContainer: Colors.blueGrey.shade100,
          surface: Colors.grey.shade900,
          onSurface: Colors.blueGrey.shade200,
          surfaceVariant: Colors.blueGrey.shade700,
          onSurfaceVariant: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _selectedIndex = 1;

  static final List<AppRoute> _routes = <AppRoute>[
    AppRoute('Контакты',
        widget: const Text('Контакты'), iconData: Icons.phone_outlined),
    AppRoute('Афиша',
        widget: const EventPoster(), iconData: Icons.deck_outlined),
    AppRoute('О барах',
        widget: const Text('О барах'), iconData: Icons.groups_outlined),
    AppRoute('Мой Есенин',
        widget: const Text('О барах'), iconData: Icons.account_circle_outlined),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: _routes[_selectedIndex].widget,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: _routes.map((e) => e.navigationDestination).toList(),
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
        ));
  }
}
