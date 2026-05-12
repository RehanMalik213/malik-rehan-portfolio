import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageView extends StatelessWidget {
  const AppImageView({
    super.key,
    required this.imagePath,
    this.imageSize,
    this.fit = BoxFit.contain,
    this.color,
  });

  final String imagePath;
  final Size? imageSize;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) return const SizedBox.shrink();

    final targetSize = imageSize ?? Size(100.w, 50.w);
    final cacheSize = _calculateCacheSize(targetSize, context);

    return _buildImage(context, cacheSize);
  }

  /// Decide image type based on path
  Widget _buildImage(BuildContext context, int cacheSize) {
    if (imagePath.startsWith('http')) {
      return _networkImage(cacheSize);
    } else if (imagePath.contains('assets/')) {
      return _assetImage(context, cacheSize);
    } else {
      return _fileImage(cacheSize);
    }
  }

  /// Network image with caching
  Widget _networkImage(int cacheSize) {
    final newPath = imagePath.endsWith('.avif')
        ? imagePath
              .replaceFirst(RegExp(r'\.avif$'), '.png')
              .replaceFirst(
                '/upload/',
                '/upload/w_$cacheSize,h_$cacheSize,q_auto:best,f_auto/',
              )
        : imagePath;

    return CachedNetworkImage(
      imageUrl: newPath,
      height: imageSize?.height.w,
      width: imageSize?.width.w,
      memCacheWidth: cacheSize,
      memCacheHeight: cacheSize,
      fit: fit,
      color: color,
      filterQuality: FilterQuality.high,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      progressIndicatorBuilder: (context, url, progress) =>
          Center(child: CircularProgressIndicator(value: progress.progress)),
    );
  }

  /// Asset image (SVG or raster)
  Widget _assetImage(BuildContext context, int cacheSize) {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        height: imageSize?.height.w,
        width: imageSize?.width.w,
        fit: fit,
        // ignore: deprecated_member_use
        color: color ?? Theme.of(context).iconTheme.color,
      );
    }

    return Image.asset(
      imagePath,
      height: imageSize?.height.w,
      width: imageSize?.width.w,
      cacheWidth: cacheSize,
      cacheHeight: cacheSize,
      fit: fit,
      color: color,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image),
    );
  }

  /// File image
  Widget _fileImage(int cacheSize) {
    return Image.file(
      File(imagePath),
      height: imageSize?.height.w,
      width: imageSize?.width.w,
      cacheWidth: cacheSize,
      cacheHeight: cacheSize,
      fit: fit,
      color: color,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image),
    );
  }

  /// Calculate cache size based on device pixel ratio
  int _calculateCacheSize(Size targetSize, BuildContext context) {
    final ratio = MediaQuery.of(context).devicePixelRatio;
    return (targetSize.shortestSide * ratio).round();
  }
}
