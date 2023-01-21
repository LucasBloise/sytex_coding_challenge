// To parse this JSON data, do
//
//     final formQuestionsEntity = formQuestionsEntityFromJson(jsonString);
import 'dart:convert';
import 'dart:ffi';

FormQuestionsEntity formQuestionsEntityFromJson(String str) =>
    FormQuestionsEntity.fromJson(json.decode(str) as Map<String, dynamic>);

String formQuestionsEntityToJson(FormQuestionsEntity data) =>
    json.encode(data.toJson());

class FormQuestionsEntity {
  FormQuestionsEntity({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.content,
  });

  final String name;
  final String description;
  final DateTime createdAt;
  final List<Content> content;

  factory FormQuestionsEntity.fromJson(Map<String, dynamic> json) =>
      FormQuestionsEntity(
        name: json["name"] as String,
        description: json["description"] as String,
        createdAt: DateTime.parse(json["created_at"] as String),
        content: List<Content>.from(
          (json["content"] as List).map(
            (x) => Content.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "content": List<dynamic>.from(
          content.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Content {
  Content({
    required this.id,
    required this.index,
    required this.type,
    this.inputType,
    this.label,
    this.answer,
    this.name,
    this.options,
  });

  final String id;
  final String index;
  final String type;
  final int? inputType;
  final String? label;
  final dynamic answer;
  final String? name;
  final List<Option>? options;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"] as String,
        index: json["index"] as String,
        type: json["type"] as String,
        inputType: json["input_type"] as int?,
        label: json["label"] as String?,
        answer: json["answer"],
        name: json["name"] as String?,
        options: json["options"] == null
            ? []
            : List<Option>.from(
                (json["options"] as List).map(
                  (x) => Option.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "type": type,
        "input_type": inputType,
        "label": label,
        "answer": answer,
        "name": name,
        "options": options == null
            ? []
            : List<dynamic>.from(
                options!.map((x) => x.toJson()),
              ),
      };
}

class Option {
  Option({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        label: json["label"] as String,
        value: json["value"] as String,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
