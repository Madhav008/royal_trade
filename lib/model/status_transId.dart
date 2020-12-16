class TransStatus {
  String userId;
  String payername;
  String bitcoinAddress;
  String transId;
  String planName;
  int price;
  String result;

  TransStatus(
      {this.userId,
      this.payername,
      this.bitcoinAddress,
      this.transId,
      this.planName,
      this.price,
      this.result});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'planName': planName,
      'price': price,
      'bitcoinAddress': bitcoinAddress,
      'transId': transId,
      'payerName': payername,
      'result': result
    };
  }

  TransStatus.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        planName = firestore['planName'],
        price = firestore['price'],
        bitcoinAddress = firestore['bitcoinAddress'],
        transId = firestore['transId'],
        payername = firestore['payerName'],
        result = firestore['result'];
}
