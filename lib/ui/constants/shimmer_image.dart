import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const ShimmerImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width,
            height: height,
            color: Colors.grey[300],
          ),
        ),
        Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(
              child: Icon(Icons.error, color: Colors.red),
            );
          },
        ),
      ],
    );
  }
}
