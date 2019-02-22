// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : HomeModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) =>
    <String, dynamic>{'data': instance.data};

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel()
    ..title = json['title'] as String
    ..subtitle = json['subtitle'] as String
    ..icon = json['icon'] as String
    ..routerName = json['routerName'] as String
    ..category = json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'icon': instance.icon,
      'routerName': instance.routerName,
      'category': instance.category
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..icon = json['icon'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{'icon': instance.icon, 'name': instance.name};
