import 'package:cached_network_image/cached_network_image.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderNetworkImage extends StatelessWidget {

  PlaceholderNetworkImage({Key key, this.url, this.size, this.borderRadius}): super (key: key);

  final String url;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
            ),
          ),
        ),
        imageUrl: url,
        placeholder: (context, _) => Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: ThemeColor.lightGrey3,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: Container(
              height: size.height, width: size.width,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
