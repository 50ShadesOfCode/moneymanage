import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class UserCredentials {
  String username;
  String password;

  UserCredentials({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'password': password,
      };

  String generateMD5(String value) {
    final Uint8List content = const Utf8Encoder().convert(value);
    final Digest digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
