import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  @override
  String toString() {
    return 'TransactionEntity(id: $id, title: $title, value: $value, date: $date)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.value == value &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ value.hashCode ^ date.hashCode;
  }

  Transaction copyWith({
    String? id,
    String? title,
    double? value,
    DateTime? date,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'value': value,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'].toString(),
      title: map['title'] as String,
      value: map['value'] as double,
      date: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
