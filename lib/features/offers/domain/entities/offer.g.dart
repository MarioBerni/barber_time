// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  discount: json['discount'] as String,
  imageUrl: json['imageUrl'] as String,
  promoCode: json['promoCode'] as String,
  type: $enumDecode(_$OfferTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  isActive: json['isActive'] as bool? ?? true,
  isFavorite: json['isFavorite'] as bool? ?? false,
  barberiaId: json['barberiaId'] as String?,
  barberiaName: json['barberiaName'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'discount': instance.discount,
      'imageUrl': instance.imageUrl,
      'promoCode': instance.promoCode,
      'type': _$OfferTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'isActive': instance.isActive,
      'isFavorite': instance.isFavorite,
      'barberiaId': instance.barberiaId,
      'barberiaName': instance.barberiaName,
      'metadata': instance.metadata,
    };

const _$OfferTypeEnumMap = {
  OfferType.discount: 'discount',
  OfferType.promotion: 'promotion',
  OfferType.event: 'event',
  OfferType.newCustomer: 'newCustomer',
  OfferType.seasonal: 'seasonal',
};
