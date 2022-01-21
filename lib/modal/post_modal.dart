import 'package:json_annotation/json_annotation.dart';

part 'post_modal.g.dart';

@JsonSerializable()
class PostObject {
  final String name;
  final String imageUrl;
  final String desc;

  const PostObject({
    required this.name,
    required this.imageUrl,
    required this.desc,
  });

  factory PostObject.fromJson(Map<String, dynamic> json) =>
      _$PostObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PostObjectToJson(this);
}
