import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DefaultScaffold extends HookWidget {
  const DefaultScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.drawer,
    this.bottomNavigation,
    this.resizeToAvoidBottomInset = false,
  });

  final AppBar? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavigation;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigation,
    );
  }
}
