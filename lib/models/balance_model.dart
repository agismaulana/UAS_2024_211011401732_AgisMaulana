import 'dart:ffi';

class BalanceModel {
  int? status;
  List<Balances>? balances;

  BalanceModel({this.status, this.balances});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    print(json);
    if (json['data'] != null) {
      balances = <Balances>[];
      json['data'].forEach((v) {
        balances!.add(Balances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.balances != null) {
      data['data'] = this.balances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Balances {
  String? id;
  String? symbol;
  String? name;
  String? nameid;
  int? rank;
  String? priceUSD;
  String? percentChange24H;
  String? percentChange1H;
  String? percentChange7D;
  String? priceBTC;
  String? marketCapUSD;
  Double? volume24;
  Double? volume24A;
  String? csupply;
  String? tsupply;
  String? msupply;

  Balances(
      {this.id,
      this.symbol,
      this.name,
      this.nameid,
      this.rank,
      this.priceUSD,
      this.percentChange24H,
      this.percentChange1H,
      this.percentChange7D,
      this.priceBTC,
      this.marketCapUSD,
      this.volume24,
      this.volume24A,
      this.csupply,
      this.tsupply,
      this.msupply});

  Balances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    nameid = json['nameid'];
    rank = json['rank'];
    priceUSD = json['price_usd'];
    percentChange24H = json['percent_change_24h'];
    percentChange1H = json['percent_change_1h'];
    percentChange7D = json['percent_change_7d'];
    priceBTC = json['price_btc'];
    marketCapUSD = json['market_cap_usd'];
    volume24 = json['24h_volume_usd'];
    volume24A = json['24h_volume_usd'];
    csupply = json['csupply'];
    tsupply = json['tsupply'];
    msupply = json['msupply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['nameid'] = this.nameid;
    data['rank'] = this.rank;
    data['price_usd'] = this.priceUSD;
    data['percent_change_24h'] = this.percentChange24H;
    data['percent_change_1h'] = this.percentChange1H;
    data['percent_change_7d'] = this.percentChange7D;
    data['price_btc'] = this.priceBTC;
    data['market_cap_usd'] = this.marketCapUSD;
    data['24h_volume_usd'] = this.volume24;
    data['24h_volume_usd'] = this.volume24A;
    data['csupply'] = this.csupply;
    data['tsupply'] = this.tsupply;
    data['msupply'] = this.msupply;
    return data;
  }
}