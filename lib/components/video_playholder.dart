import 'package:client/components/skeleton.dart';
import 'package:flutter/material.dart';

class VideoPlaceholder extends StatelessWidget {
  const VideoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            height: 201,
          ),
          SizedBox(
            height: 16,
          ),
          Skeleton(
            height: 24,
          ),
          SizedBox(
            height: 8,
          ),
          Skeleton(
            width: 150,
            height: 24,
          ),
        ]);
    ;
  }
}
