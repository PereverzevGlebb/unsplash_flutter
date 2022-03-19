import 'package:flutter/material.dart';

import '../../service/UnsplashApiService.dart';
import '../common/PhotoItem.dart';
import '../search/SearchScreen.dart';

class PhotoFeedPage extends StatefulWidget {
  const PhotoFeedPage({Key? key}) : super(key: key);

  @override
  _PhotoFeedPage createState() => _PhotoFeedPage();
}

class _PhotoFeedPage extends State<PhotoFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Photo Feed'),
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchScreen())),
                icon: const Icon(Icons.search))
          ],
        ),
        body: getPhotosFeed());
  }

  Widget getPhotosFeed() {
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
