import 'package:flutter/material.dart';

class Category {
  final String id;
  String name;
  Color? color;

  Category({required this.id, required this.name, this.color});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color?.toARGB32(),
    };
  }

  // JSON'dan geri çekme (Deserialization)
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      color: json['color'] != null ? Color(json['color']) : null,
    );
  }
}
