import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../../model/PhotoCardResult.dart';
import '../../service/UnsplashApiService.dart';


class DetailScreen extends StatelessWidget {
  PhotoPostResult? photo;

  DetailScreen(this.photo);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.vertical,
      key: const Key('key'),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: Scaffold(
        body: GestureDetector(
          child: Center(
            child: PinchZoom(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: photo?.urls?.full ?? UnsplashApiService().errorLogo,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(UnsplashApiService().errorLogo),
              ),
              resetDuration: const Duration(milliseconds: 100),
              maxScale: 2.5,
              onZoomStart: (){},
              onZoomEnd: (){},
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}