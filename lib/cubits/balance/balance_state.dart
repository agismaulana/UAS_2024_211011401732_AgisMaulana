part of 'balance_cubit.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class BalanceData extends BalanceState {
  final BalanceModel balances;
  BalanceData(this.balances);
}