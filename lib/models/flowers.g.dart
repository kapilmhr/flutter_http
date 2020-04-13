// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flowers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flower _$FlowerFromJson(Map<String, dynamic> json) {
  return Flower(
    name: json['name'] as String,
    category: json['category'] as String,
    photo: json['photo'] as String,
  );
}

Map<String, dynamic> _$FlowerToJson(Flower instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'photo': instance.photo,
    };
