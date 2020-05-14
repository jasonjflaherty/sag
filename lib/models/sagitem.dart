import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'sagitem.g.dart';

/// A `jsonplaceholder` post. See http://jsonplaceholder.typicode.com/posts.
@JsonSerializable()
class Sag {
  const Sag(
      {@required this.manufacturer,
      @required this.model,
      @required this.comments,
      @required this.image,
      @required this.description});

  factory Sag.fromJson(Map<String, dynamic> json) => _$SagFromJson(json);

  final String manufacturer;
  final String model;
  final String comments;
  final String image;
  final String description;

  static Iterable<Sag> fromJsonArray(String jsonString) =>
      (json.decode(jsonString) as List)
          .map((item) => Sag.fromJson(item as Map<String, dynamic>));
}
