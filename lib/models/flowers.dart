import 'package:json_annotation/json_annotation.dart';

part 'flowers.g.dart';

@JsonSerializable()
class Flower {
  String name;
  String category;
  String photo;

  Flower({this.name, this.category, this.photo});

  factory Flower.fromJson(Map<String, dynamic> json) => _$FlowerFromJson(json);

  Map<String, dynamic> toJson() => _$FlowerToJson(this);
}
