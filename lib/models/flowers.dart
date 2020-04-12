import 'package:json_annotation/json_annotation.dart';

part 'flowers.g.dart';

@JsonSerializable()
class Flower {
  String name;
  String category;

  Flower({this.name, this.category});

  factory Flower.fromJson(Map<String, dynamic> json) => _$FlowerFromJson(json);

  Map<String, dynamic> toJson() => _$FlowerToJson(this);
}
