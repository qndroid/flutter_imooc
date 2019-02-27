// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return SearchModel()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SearchItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{'data': instance.data};

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) {
  return SearchItem()
    ..key = json['key'] as String
    ..value = json['value'] as String;
}

Map<String, dynamic> _$SearchItemToJson(SearchItem instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.value};
