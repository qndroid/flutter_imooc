// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel()
    ..defaultId = json['defaultId'] as String
    ..mainCategoryItems = (json['mainCategoryItems'] as List)
        ?.map((e) => e == null
            ? null
            : MainCategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'defaultId': instance.defaultId,
      'mainCategoryItems': instance.mainCategoryItems
    };

MainCategoryItem _$MainCategoryItemFromJson(Map<String, dynamic> json) {
  return MainCategoryItem()
    ..cateId = json['cateId'] as String
    ..cateName = json['cateName'] as String
    ..subCategoryGroups = (json['subCategoryGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SubCategoryGroup.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MainCategoryItemToJson(MainCategoryItem instance) =>
    <String, dynamic>{
      'cateId': instance.cateId,
      'cateName': instance.cateName,
      'subCategoryGroups': instance.subCategoryGroups
    };

SubCategoryGroup _$SubCategoryGroupFromJson(Map<String, dynamic> json) {
  return SubCategoryGroup()
    ..cateGroupName = json['cateGroupName'] as String
    ..cateList = (json['cateList'] as List)
        ?.map((e) => e == null
            ? null
            : SubCategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SubCategoryGroupToJson(SubCategoryGroup instance) =>
    <String, dynamic>{
      'cateGroupName': instance.cateGroupName,
      'cateList': instance.cateList
    };

SubCategoryItem _$SubCategoryItemFromJson(Map<String, dynamic> json) {
  return SubCategoryItem()
    ..cateId = json['cateId'] as String
    ..cateTitle = json['cateTitle'] as String
    ..cateUrl = json['cateUrl'] as String;
}

Map<String, dynamic> _$SubCategoryItemToJson(SubCategoryItem instance) =>
    <String, dynamic>{
      'cateId': instance.cateId,
      'cateTitle': instance.cateTitle,
      'cateUrl': instance.cateUrl
    };
