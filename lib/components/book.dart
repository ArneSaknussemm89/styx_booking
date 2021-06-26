import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:styx/styx.dart';

part 'book.g.dart';

@JsonSerializable()
class BookComponent extends Component
    with SerializableComponent, EquatableMixin {
  BookComponent({String title = '', String isbn = '', String authorName = ''}) {
    this.title(title);
    this.isbn(isbn);
    this.authorName(authorName);
  }

  final title = ''.obs;
  final isbn = ''.obs;
  final authorName = ''.obs;

  @override
  List<Object?> get props => [title(), isbn(), authorName()];

  factory BookComponent.fromJson(Map<String, dynamic> json) =>
      _$BookComponentFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "title": title(),
      "isbn": isbn(),
      "authorName": authorName(),
    };
  }
}

class FavoriteComponent extends Component
    with SerializableComponent, EquatableMixin {
  FavoriteComponent();

  @override
  List<Object?> get props => [];

  factory FavoriteComponent.fromJson(Map<String, dynamic> json) =>
      FavoriteComponent();

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
