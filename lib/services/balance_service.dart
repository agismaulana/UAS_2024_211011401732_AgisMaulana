import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uas/models/balance_model.dart';

class BalanceService {
  final Dio _dio = Dio();

  Future<Either<String, BalanceModel>> GETBalance() async {
    try {
      var response = await _dio.get(
        "https://api.coinlore.net/api/tickers/"
      );

      var result = BalanceModel.fromJson(response.data);
      return Right(result);
    } catch(e) {
      return Left(e.toString());
    }
  }
}