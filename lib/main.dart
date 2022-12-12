import 'package:fdpook/providers/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoApp.router(
      title: 'Fdpook',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
      theme: const CupertinoThemeData(),
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xff263859),
      //   ),
      //   textTheme: const TextTheme(
      //     titleLarge: TextStyle(fontSize: 16),
      //   ),
      //   colorScheme: const ColorScheme.dark(),
      // ),
    );
  }
}
