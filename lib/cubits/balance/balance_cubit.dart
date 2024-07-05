
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas/models/balance_model.dart';
import 'package:uas/services/balance_service.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitial()); //initial state

  BalanceService _balanceService = BalanceService();

  LoadDataBalance() async {
    var res = await _balanceService.GETBalance();
    res.fold(
      (l) => print(l),
      (r) => emit(BalanceData(r))
    );
  }
}