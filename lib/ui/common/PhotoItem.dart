import 'package:flutter/material.dart';
import '../../model/PhotoCardResult.dart';
import 'DetailScreen.dart';

class PhotoItem extends StatelessWidget {
  PhotoPostResult? photo;

  PhotoItem({Key? key, @required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        padding: const EdgeInsets.all(25),
        child: InkWell(
          onTap: () async {
            await showDialog(
                context: context, builder: (_) => DetailScreen(photo));
          },
          child: photo?.urls?.full != null
              ? Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photo?.urls?.full ?? ""),
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    "No result:(",
                    textAlign: TextAlign.center,
                  ),
                ),
        ));
  }
}