import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Content {
  Content({required this.content, this.id});
  String? id;
  final String content;
}

String generateId(String content) {
  final idToByte = utf8.encode(content);
  final contentId = sha256.convert(idToByte);
  return contentId.toString();
}
