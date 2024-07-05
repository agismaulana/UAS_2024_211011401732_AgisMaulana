import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas/cubits/balance/balance_cubit.dart';

class BalanceScreen extends StatefulWidget {
  BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  BalanceCubit _balanceCubit = BalanceCubit();

  void initState() {
    _balanceCubit.LoadDataBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto List"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<BalanceCubit, BalanceState> (
            bloc: _balanceCubit,
            builder: (context, state) {
              if (state is BalanceData) {
                return ListView.builder(
                  itemCount: state.balances.balances?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.balances.balances?[index].name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        )
                      ),
                      subtitle: Text(state.balances.balances?[index].symbol ?? ""),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.balances.balances?[index].priceUSD != null ? "\$ ${state.balances.balances?[index].priceUSD}" : "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(state.balances.balances?[index].percentChange24H != null ? "${state.balances.balances?[index].percentChange24H}% (24H)" : ""),
                        ],
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: Text("Loading ..."),
              );
            }
          )
        ),
      )
    );
  }
}