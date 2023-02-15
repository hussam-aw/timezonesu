// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Example {
  final int id;
  final String name;
  Example({
    required this.id,
    required this.name,
  });

  Example copyWith({
    int? id,
    String? name,
  }) {
    return Example(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Example.fromMap(Map<String, dynamic> map) {
    return Example(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Example.fromJson(String source) => Example.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Example(id: $id, name: $name)';

  @override
  bool operator ==(covariant Example other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
