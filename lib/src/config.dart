import 'package:flutter/foundation.dart';
import 'package:flutter_ravepay/src/meta.dart';

class RavepayConfig {
  final double amount;
  final String country;
  final String currency;
  final String email;
  final String firstname;
  final String lastname;
  final String narration;
  final String publicKey;
  final String encryptionKey;
  final String txRef;
  final bool useAccounts;
  final bool useCards;
  final bool isStaging;
  final bool isPreAuth;
  final bool useSave;
  final bool style;
  final List<RavepayMeta> metadata;

  const RavepayConfig({
    @required this.amount,
    @required this.country,
    @required this.currency,
    @required this.email,
    @required this.firstname,
    this.lastname = "",
    this.narration = "",
    @required this.publicKey,
    @required this.encryptionKey,
    @required this.txRef,
    this.metadata,
    this.useAccounts = true,
    this.useCards = true,
    this.isStaging = true,
    this.isPreAuth = false,
    this.useSave = true,
    this.style,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "amount": amount.toString(),
      "currency": currency,
      "country": country,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "narration": narration,
      "publicKey": publicKey,
      "encryptionKey": encryptionKey,
      "txRef": txRef,
      "useAccounts": useAccounts,
      "metadata": metadata != null
          ? metadata.map((meta) => meta.toMap()).toList()
          : <String>[],
      "useCards": useCards,
      "isStaging": isStaging,
      "isPreAuth": isPreAuth,
      "useSave": useSave,
      "style": null,
    };
  }
}
