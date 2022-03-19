import 'package:flutter/material.dart';

import '../../service/UnsplashApiService.dart';
import '../common/PhotoItem.dart';


class PhotoFeedPage extends StatefulWidget {
  const PhotoFeedPage({Key? key}) : super(key: key);

  @override
  _PhotoFeedPage createState() => _PhotoFeedPage();
}


class _PhotoFeedPage extends State<PhotoFeedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getPhotosFeed()
    );
  }

  Widget getPhotosFeed(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: UnsplashApiService().fetchRandomPhotos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return PhotoItem(photo: snapshot.data[index]);
                    },
                  );
                }
              },
            ),
          )
        ],
      );
  }
}
