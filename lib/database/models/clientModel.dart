import 'package:flutter/material.dart';

class ClientModel {
  String clientId;
  String clientName;
  String clientEmail;
  String clientPhone;

  ClientModel(
      {@required this.clientId,
      @required this.clientName,
      @required this.clientEmail,
      @required this.clientPhone});

  Map<String, dynamic> toMap() {
    return {
      "clientId": clientId,
      "clientName": clientName,
      "clientEmail": clientEmail,
      "clientPhone": clientPhone
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> firestoreObj) {
    ClientModel clientModelObj = ClientModel(
        clientId: firestoreObj['clientId'],
        clientName: firestoreObj['clientName'],
        clientEmail: firestoreObj['clientEmail'],
        clientPhone: firestoreObj['clientPhone']);
    return clientModelObj;
  }
}
