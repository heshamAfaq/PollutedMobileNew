// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all-epicenter-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEpicenterModel _$AllEpicenterModelFromJson(Map<String, dynamic> json) {
  return AllEpicenterModel(
    Model: (json['Model'] as List<dynamic>)
        .map((e) => EpicenterDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalItems: json['totalItems'] as String,
  );
}

Map<String, dynamic> _$AllEpicenterModelToJson(AllEpicenterModel instance) =>
    <String, dynamic>{
      'Model': instance.Model,
      'totalItems': instance.totalItems,
    };
