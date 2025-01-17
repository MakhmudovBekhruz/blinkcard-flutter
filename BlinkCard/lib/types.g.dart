// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardNumberAnonymizationSettings _$CardNumberAnonymizationSettingsFromJson(
    Map<String, dynamic> json) {
  return CardNumberAnonymizationSettings()
    ..mode =
        _$enumDecodeNullable(_$BlinkCardAnonymizationModeEnumMap, json['mode'])
    ..prefixDigitsVisible = json['prefixDigitsVisible'] as int
    ..suffixDigitsVisible = json['suffixDigitsVisible'] as int;
}

Map<String, dynamic> _$CardNumberAnonymizationSettingsToJson(
        CardNumberAnonymizationSettings instance) =>
    <String, dynamic>{
      'mode': _$BlinkCardAnonymizationModeEnumMap[instance.mode],
      'prefixDigitsVisible': instance.prefixDigitsVisible,
      'suffixDigitsVisible': instance.suffixDigitsVisible,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BlinkCardAnonymizationModeEnumMap = {
  BlinkCardAnonymizationMode.None: 1,
  BlinkCardAnonymizationMode.ImageOnly: 2,
  BlinkCardAnonymizationMode.FieldsOnly: 3,
  BlinkCardAnonymizationMode.FullResult: 4,
};

BlinkCardAnonymizationSettings _$BlinkCardAnonymizationSettingsFromJson(
    Map<String, dynamic> json) {
  return BlinkCardAnonymizationSettings()
    ..cardNumberAnonymizationSettings =
        json['cardNumberAnonymizationSettings'] == null
            ? null
            : CardNumberAnonymizationSettings.fromJson(
                json['cardNumberAnonymizationSettings'] as Map<String, dynamic>)
    ..cardNumberPrefixAnonymizationMode = _$enumDecodeNullable(
        _$BlinkCardAnonymizationModeEnumMap,
        json['cardNumberPrefixAnonymizationMode'])
    ..cvvAnonymizationMode = _$enumDecodeNullable(
        _$BlinkCardAnonymizationModeEnumMap, json['cvvAnonymizationMode'])
    ..ibanAnonymizationMode = _$enumDecodeNullable(
        _$BlinkCardAnonymizationModeEnumMap, json['ibanAnonymizationMode'])
    ..ownerAnonymizationMode = _$enumDecodeNullable(
        _$BlinkCardAnonymizationModeEnumMap, json['ownerAnonymizationMode']);
}

Map<String, dynamic> _$BlinkCardAnonymizationSettingsToJson(
        BlinkCardAnonymizationSettings instance) =>
    <String, dynamic>{
      'cardNumberAnonymizationSettings':
          instance.cardNumberAnonymizationSettings,
      'cardNumberPrefixAnonymizationMode': _$BlinkCardAnonymizationModeEnumMap[
          instance.cardNumberPrefixAnonymizationMode],
      'cvvAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.cvvAnonymizationMode],
      'ibanAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.ibanAnonymizationMode],
      'ownerAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.ownerAnonymizationMode],
    };

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
    Map<String, dynamic> json) {
  return ImageExtensionFactors()
    ..upFactor = (json['upFactor'] as num)?.toDouble()
    ..rightFactor = (json['rightFactor'] as num)?.toDouble()
    ..downFactor = (json['downFactor'] as num)?.toDouble()
    ..leftFactor = (json['leftFactor'] as num)?.toDouble();
}

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };
