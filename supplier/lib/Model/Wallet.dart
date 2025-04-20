class WalletTrans {
  int? id;
  int? userId;
  // Null? transactionId;
  int? balance;
  String? createdAt;
  String? updatedAt;
  List<Transaction>? transaction;

  WalletTrans(
      {this.id,
      this.userId,
      // this.transactionId,
      this.balance,
      this.createdAt,
      this.updatedAt,
      this.transaction});

  WalletTrans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    // transactionId = json['transaction_id'];
    balance = json['balance'];
    createdAt = json['created_at'];
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(Transaction.fromJson(v));
      });
    }
  }
}

class Transaction {
  int? id;
  int? userId;
  String? number;
  int? amount;
  String? status;
  String? createdAt;
  int? walletId;
  String? image;

  Transaction(
      {this.id,
      this.userId,
      this.number,
      this.amount,
      this.status,
      this.createdAt,
      this.walletId,
      this.image});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    number = json['number'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    walletId = json['wallet_id'];
    image = json['image'];
  }
}
