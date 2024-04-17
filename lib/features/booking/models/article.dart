import 'package:medica_consult/features/authentication/models/doctor.dart';
import 'package:medica_consult/features/authentication/models/member.dart';

class Message {
  int _articleId;
  Member _author;
  String _title;
  String _content;
  String _category;
  DateTime _date;

  Message({
    required int articleId,
    required Doctor auther,
    required String title,
    required String content,
    required String category,
    required DateTime date,
  })  : _articleId = articleId,
        _author = auther,
        _title = title,
        _content = content,
        _category = category,
        _date = date;

  // Getters and Setters
  int get getArticleId => _articleId;
  set setArticleId(int value) {
    _articleId = value;
  }

  Member get getAuther => _author;
  set setAuther(Member value) {
    _author = value;
  }

  String get getContent => _content;
  set setContent(String value) {
    _content = value;
  }

  String get getTitle => _title;
  set setTitle(String value) {
    _title = value;
  }

  String get getCategory => _category;
  set setCategory(String value) {
    _category = value;
  }

  DateTime get getDate => _date;
  set setDate(DateTime value) {
    _date = value;
  }
}
