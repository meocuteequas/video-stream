import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
              itemCount: 9,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (contex, index) => SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: (1 + Random().nextInt(2)) * 201),
                  ));;
  }
}