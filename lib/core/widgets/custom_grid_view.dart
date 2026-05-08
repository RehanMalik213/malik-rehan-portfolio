import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions/hover_ext.dart';
import 'package:portfolio/core/extensions/widget_ext/widget_extensions.dart';

class CustomGridView<T> extends StatelessWidget {
  final int desktopGrid;
  final int tabletGrid;
  final int mobileGrid;
  final List<T> items;
  final double? horizontalSpace;
  final double? verticalSpace;
  final Widget Function(T item) itemBuilder;
  final Color? hoverColor;
  final Function()? onClick;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const CustomGridView({
    super.key,
    required this.desktopGrid,
    required this.tabletGrid,
    required this.mobileGrid,
    required this.itemBuilder,
    required this.items,
    this.onClick,
    this.horizontalSpace,
    this.verticalSpace,
    this.hoverColor,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive columns count
        int crossAxisCount;
        if (constraints.maxWidth >= 800) {
          crossAxisCount = desktopGrid; // Desktop
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = tabletGrid; // Tablet
        } else {
          crossAxisCount = mobileGrid; // Mobile
        }

        final itemWidth = constraints.maxWidth / crossAxisCount;

        return Align(
          alignment: .center,
          child: Wrap(
            spacing: (horizontalSpace ?? 10).w,
            runSpacing: (verticalSpace ?? 15).h,
            children: items.map((item) {
              return Container(
                    padding:
                        padding ??
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    width: itemWidth - 15.w,
                    height: height,
                    child: itemBuilder(item),
                  )
                  .glowOnHover(hoverColor: hoverColor)
                  .zoomOnHover(scale: 1.02)
                  .onViewClick(() => onClick?.call());
            }).toList(),
          ),
        );
      },
    );
  }
}
