import 'package:go_router/go_router.dart';
import 'package:wallpaper_ui/views/category.dart';
import 'package:wallpaper_ui/views/home.dart';
import 'package:wallpaper_ui/views/splashscreen.dart';
import 'package:wallpaper_ui/views/wallpaper_view.dart';

abstract class AppRoute {
  static const kHome = '/home';
  static const kCategory = '/category';
  static const kWallPage = '/wallpaper';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: kCategory,
        builder: (context, state) => const CategoryPage(
          categoryName: 'Categoryname',
        ),
      ),
      GoRoute(
        path: kWallPage,
        builder: (context, state) => const WallpaperPage(),
      ),
    ],
  );
}
