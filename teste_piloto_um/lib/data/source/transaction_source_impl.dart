import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_piloto_um/data/entities/transaction_impl.dart';
import 'package:teste_piloto_um/domain/source/transaction_source.dart';

class TransactionSourceImpl implements TransactionSource {
  static const String url =
      "PASTE YOUR URL FROM RAW OF YOUR GIST HERE";
  static const String token = "PASTE YOUR GITHUB TOKEN HERE";

  Dio dio = Dio();

  @override
  Future<bool> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Transaction> get(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getAll() async {
    final response = await dio.get(
      url,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    final data = json.decode(response.data);
    // debugPrint(data.toString());
    return data.map<Transaction>((e) {
      debugPrint(e.toString());
      debugPrint(e['id'].runtimeType.toString());
      debugPrint(e['title'].runtimeType.toString());
      debugPrint(e['value'].runtimeType.toString());
      debugPrint(e['date'].runtimeType.toString());

      return Transaction.fromMap(e);
    }).toList();
  }

  @override
  Future<void> set(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(String id) {
    throw UnimplementedError();
  }
}
