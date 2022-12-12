import 'package:fdpook/pages/home.dart';
import 'package:fdpook/pages/preview.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppRoute {
  home('/'),
  preview('/preview'),
  ;

  const AppRoute(this.path);
  final String path;
}

final routerProvider = Provider(
  (ref) => GoRouter(routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoute.preview.path,
      builder: (context, state) => const PreviewPage(),
    ),
  ]),
);
