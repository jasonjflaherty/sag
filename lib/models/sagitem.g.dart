// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sagitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sag _$SagFromJson(Map<String, dynamic> json) {
  return Sag(
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      comments: json['comments'] as String,
      image: json['image'] as String,
      description: json['description'] as String);
}

Map<String, dynamic> _$SagToJson(Sag instance) => <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'comments': instance.comments,
      'image': instance.image,
      'description': instance.description
    };
