// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVersionData _$CheckVersionDataFromJson(Map<String, dynamic> json) {
  return CheckVersionData()
    ..code = json['code'] as int
    ..currentVersion = json['currentVersion'] as int;
}

Map<String, dynamic> _$CheckVersionDataToJson(CheckVersionData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'currentVersion': instance.currentVersion
    };
