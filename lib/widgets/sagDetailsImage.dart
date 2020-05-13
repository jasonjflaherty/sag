import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SagImage extends StatelessWidget {
  final String url = "https://www.fs.fed.us/research/images/carousel/";
  final String imgUrl;

  SagImage(this.imgUrl);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //print(imgUrl);
    return CachedNetworkImage(
        imageUrl: url + imgUrl,
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      );
  }
}
