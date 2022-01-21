// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostObject _$PostObjectFromJson(Map<String, dynamic> json) => PostObject(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$PostObjectToJson(PostObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'desc': instance.desc,
    };
