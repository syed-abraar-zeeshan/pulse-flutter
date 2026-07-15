import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_flutter/core/theme/theme_provider.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(  //This initializes Riverpod.
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Pulse',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,

      darkTheme: AppTheme.dark,

      themeMode: themeMode.value ?? ThemeMode.system,

      home: const Scaffold(
        body: Center(
          child: Text('Pulse'),
        ),
      ),
    );
  }
}