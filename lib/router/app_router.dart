import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:jad/screens/cart/cart_screen.dart';
import 'package:jad/screens/details/details_product.dart';
import 'package:jad/screens/home/home_screen.dart';
import 'package:jad/screens/layout/home_layout.dart';
import 'package:jad/screens/order.dart/order_screen.dart';

class AppRouter {
  static const homeScreen = '/home';
  static const cartScreen = '/cart';
  static const homeLayout = '/homeLayout';
  static const detailsScreen = '/detailsScreen';
  static const orderScreen = '/orderScreen';
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    final Route route;
    switch (settings.name) {
      case AppRouter.homeLayout:
        route = CupertinoPageRoute(builder: (_) => const HomeLayout());
        break;
      case AppRouter.homeScreen:
        route = CupertinoPageRoute(builder: (_) => const HomeScreen());
        break;
      case AppRouter.cartScreen:
        route = CupertinoPageRoute(builder: (_) => const CartScreen());
        break;
      case AppRouter.orderScreen:
        route = CupertinoPageRoute(builder: (_) => const OrderScreen());
        break;
      case AppRouter.detailsScreen:
        final productName = settings.arguments as String;
        route = CupertinoPageRoute(
            builder: (_) => DetailsProduct(
                  productName: productName,
                ));
        break;
      default:
        route = CupertinoPageRoute(builder: (_) => const HomeLayout());
    }
    return route;
  }

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routerNeglect: true,
    routes: [],
  );
}
