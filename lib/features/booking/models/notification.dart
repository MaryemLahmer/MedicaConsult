import 'package:medica_consult/features/authentication/models/member.dart';

class Message {
  int _messageId;
  Member _sender;
  Member _receiver;
  String _content;
  String _type;
  DateTime _dateTime;

  Message({
    required int messageId,
    required Member sender,
    required Member receiver,
    required String content,
    required String type,
    required DateTime dateTime,
  })  : _messageId = messageId,
        _sender = sender,
        _receiver = receiver,
        _content = content,
        _type = type,
        _dateTime = dateTime;

  // Getters and Setters
  int get getMessageId => _messageId;
  set messageId(int value) {
    _messageId = value;
  }

  Member get getSender => _sender;
  set sender(Member value) {
    _sender = value;
  }

  Member get getReceiver => _receiver;
  set receiver(Member value) {
    _receiver = value;
  }

  String get getContent => _content;
  set content(String value) {
    _content = value;
  }

  String get getType => _type;
  set type(String value) {
    _type = value;
  }

  DateTime get getDateTime => _dateTime;
  set dateTime(DateTime value) {
    _dateTime = value;
  }
}
