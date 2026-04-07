import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_base/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.name,
    @JsonKey(name: 'avatar_url') super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        email: entity.email,
        name: entity.name,
        avatarUrl: entity.avatarUrl,
      );
}
