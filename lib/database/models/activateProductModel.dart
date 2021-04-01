class ActivateProductModel {
  String clientId;
  String clientName;
  String clientEmail;
  String clientPhone;
  String product;
  static DateTime currentDate = DateTime.now();
  DateTime warrantyExp =
      DateTime(currentDate.year + 2, currentDate.month, currentDate.day);

  ActivateProductModel({
    this.clientId,
    this.clientName,
    this.clientEmail,
    this.clientPhone,
    this.product,
  });

  Map<String, dynamic> toMap() {
    return {
      "clientId": clientId,
      'clientName': clientName,
      'clientEmail': clientEmail,
      "clientPhone": clientPhone,
      "product": product,
      "ActivateDate": currentDate,
      "warrantyExp": warrantyExp,
    };
  }

  factory ActivateProductModel.fromMap(Map<String, dynamic> firestoreObj) {
    ActivateProductModel activateObj = ActivateProductModel(
        clientId: firestoreObj['clientId'],
        clientName: firestoreObj['clientName'],
        clientEmail: firestoreObj['clientEmail'],
        clientPhone: firestoreObj['clientPhone'],
        product: firestoreObj['product']);

    return activateObj;
  }
}
