import 'package:sag/utils/constants.dart';
/*
json formatted like:
"Manufacture": "Nelson Global Products",
      "Model": "MD300082",
      "Comments": "",
      "Image": "https://www.fs.fed.us/sites/all/themes/fs_hq/images/recreation.jpg",
      "Description": ""
 */
class SagItem {
  final String manufacturer;
  final String model;
  final String comments;
  final String image;
  final String description;

  SagItem({this.manufacturer, this.model, this.comments, this.image,
      this.description});

  factory SagItem.fromJson(Map<String, dynamic> json) {
    return new SagItem(
      manufacturer: json['Manufacture'] as String,
      model: json['Model'] as String,
      comments: json['Comments'] as String ?? Constants.SAG_COMMENT_PLACEHOLDER,
      image: json['Image'] as String ?? Constants.SAG_PLACEHOLDER_IMAGE_ASSET_URL,
      description: json['Description'] as String ?? Constants.SAG_DESC_PLACEHOLDER,
    );
  }
}