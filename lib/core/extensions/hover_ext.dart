import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/themes/app_colors.dart';

extension GlowHoverExtension on Widget {
  Widget glowOnHover({
    Duration duration = const Duration(milliseconds: 200),
    Color? hoverColor,
    Color? borderColor,
  }) {
    return _GlowOnHover(
      duration: duration,
      hoverColor: hoverColor,
      borderColor: borderColor,
      child: this,
    );
  }
}

class _GlowOnHover extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color? hoverColor;
  final Color? borderColor;

  const _GlowOnHover({
    required this.child,
    required this.duration,
    this.hoverColor,
    this.borderColor,
  });

  @override
  State<_GlowOnHover> createState() => _GlowOnHoverState();
}

class _GlowOnHoverState extends State<_GlowOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.hoverColor ?? AppColors.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,

        decoration: BoxDecoration(
          color: _hovering ? primaryColor.withAlpha(50) : null,
          border: Border.all(
            color: _hovering
                ? primaryColor
                : widget.borderColor ?? AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radius),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.0),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ZoomHoverExtension on Widget {
  Widget zoomOnHover({
    double scale = 1.1,
    Duration duration = const Duration(milliseconds: 200),
  }) {
    return _ZoomOnHover(scale: scale, duration: duration, child: this);
  }
}

class _ZoomOnHover extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const _ZoomOnHover({
    required this.child,
    required this.scale,
    required this.duration,
  });

  @override
  State<_ZoomOnHover> createState() => _ZoomOnHoverState();
}

class _ZoomOnHoverState extends State<_ZoomOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}

extension GradientSwapHoverExtension on Widget {
  Widget gradientSwapOnHover({
    Duration duration = const Duration(milliseconds: 300),
    Color? primary,
    Color? secondary,
    double blurRadius = 12,
    double spreadRadius = 2,
    double borderRadius = 10,
  }) {
    return _GradientSwapOnHover(
      duration: duration,
      primary: primary ?? AppColors.primary,
      secondary: secondary ?? AppColors.secondary,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      borderRadius: borderRadius,
      child: this,
    );
  }
}

class _GradientSwapOnHover extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color primary;
  final Color secondary;
  final double blurRadius;
  final double spreadRadius;
  final double borderRadius;

  const _GradientSwapOnHover({
    required this.child,
    required this.duration,
    required this.primary,
    required this.secondary,
    required this.blurRadius,
    required this.spreadRadius,
    required this.borderRadius,
  });

  @override
  State<_GradientSwapOnHover> createState() => _GradientSwapOnHoverState();
}

class _GradientSwapOnHoverState extends State<_GradientSwapOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final normalGradient = [widget.primary, widget.secondary];
    final swappedGradient = [widget.secondary, widget.primary];

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _hovering ? swappedGradient : normalGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: widget.primary.withValues(alpha: 0.5),
                    blurRadius: widget.blurRadius,
                    spreadRadius: widget.spreadRadius,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
