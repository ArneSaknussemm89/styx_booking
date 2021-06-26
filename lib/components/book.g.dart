// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookComponent _$BookComponentFromJson(Map<String, dynamic> json) {
  return BookComponent(
    title: json['title'] as String,
    isbn: json['isbn'] as String,
    authorName: json['authorName'] as String,
  );
}

Map<String, dynamic> _$BookComponentToJson(BookComponent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isbn': instance.isbn,
      'authorName': instance.authorName,
    };
