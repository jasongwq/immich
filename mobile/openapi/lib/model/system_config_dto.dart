//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SystemConfigDto {
  /// Returns a new [SystemConfigDto] instance.
  SystemConfigDto({
    required this.ffmpeg,
    required this.oauth,
    required this.storageTemplate,
  });

  SystemConfigFFmpegDto ffmpeg;

  SystemConfigOAuthDto oauth;

  SystemConfigStorageTemplateDto storageTemplate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SystemConfigDto &&
     other.ffmpeg == ffmpeg &&
     other.oauth == oauth &&
     other.storageTemplate == storageTemplate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ffmpeg.hashCode) +
    (oauth.hashCode) +
    (storageTemplate.hashCode);

  @override
  String toString() => 'SystemConfigDto[ffmpeg=$ffmpeg, oauth=$oauth, storageTemplate=$storageTemplate]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'ffmpeg'] = ffmpeg;
      _json[r'oauth'] = oauth;
      _json[r'storageTemplate'] = storageTemplate;
    return _json;
  }

  /// Returns a new [SystemConfigDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SystemConfigDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SystemConfigDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SystemConfigDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SystemConfigDto(
        ffmpeg: SystemConfigFFmpegDto.fromJson(json[r'ffmpeg'])!,
        oauth: SystemConfigOAuthDto.fromJson(json[r'oauth'])!,
        storageTemplate: SystemConfigStorageTemplateDto.fromJson(json[r'storageTemplate'])!,
      );
    }
    return null;
  }

  static List<SystemConfigDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SystemConfigDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SystemConfigDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SystemConfigDto> mapFromJson(dynamic json) {
    final map = <String, SystemConfigDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemConfigDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SystemConfigDto-objects as value to a dart map
  static Map<String, List<SystemConfigDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SystemConfigDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemConfigDto.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ffmpeg',
    'oauth',
    'storageTemplate',
  };
}

