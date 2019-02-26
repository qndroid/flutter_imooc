// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userId = json['userId'] as String
    ..photoUrl = json['photoUrl'] as String
    ..name = json['name'] as String
    ..tick = json['tick'] as String
    ..mobile = json['mobile'] as String
    ..platform = json['platform'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'tick': instance.tick,
      'mobile': instance.mobile,
      'platform': instance.platform
    };
