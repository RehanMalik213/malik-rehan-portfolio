import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appbar;
  final Color? backgroundColor;
  final double? horizontalSpace;
  final bool isScrollEnable;
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomInset;
  final Widget? drawer;
  final Key? scaffoldKey;
  final Color? statusBarColor;
  final bool? disableHorizontalPadding;

  const BasePage({
    super.key,
    required this.child,
    this.appbar,
    this.isScrollEnable = false,
    this.backgroundColor,
    this.horizontalSpace,
    this.drawer,
    this.scaffoldKey,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.statusBarColor,
    this.disableHorizontalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        appBar: appbar,

        drawer: drawer,
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(children: [Expanded(child: _child(context))]),
        ),
      ),
    );
  }

  /// Wrap child with scroll if enabled
  Widget _child(BuildContext context) {
    final content = disableHorizontalPadding == true
        ? child
        : Padding(
            padding: _padding(context: context),
            child: child,
          );

    return isScrollEnable
        ? ScrollConfiguration(
            behavior: NoScrollbarBehavior(),
            child: SingleChildScrollView(child: content),
          )
        : content;
  }

  /// Dynamic padding based on flags
  EdgeInsets _padding({required BuildContext context}) {
    return EdgeInsets.only(
      left: (horizontalSpace ?? MediaQuery.of(context).size.width / 35).w,
      right: (horizontalSpace ?? MediaQuery.of(context).size.width / 35).w,
    );
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
