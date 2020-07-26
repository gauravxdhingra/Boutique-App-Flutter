import 'package:cloud_firestore/cloud_firestore.dart';

class SizeModel {
  final String lengthKamiz;
  final String chestKamiz;
  final String kamarKamiz;
  final String hipKamiz;
  final String gheraKamiz;
  final String baajuKamiz;
  final String baajuMoriKamiz;
  final String armolKamiz;
  final String neckFrontKamiz;
  final String neckBackKamiz;

  final String lengthSalwar;
  final String moriSalwar;
  final String beltSalwar;

  final String lengthPant;
  final String moriPant;
  final String kneePant;
  final String thighPant;
  final String kamarPant;
  final String beltPant;
  final String chainPant;
  final String pocketsPant;

  final String imageUrl;

  SizeModel({
    this.imageUrl,
    this.lengthKamiz,
    this.chestKamiz,
    this.kamarKamiz,
    this.hipKamiz,
    this.gheraKamiz,
    this.baajuKamiz,
    this.baajuMoriKamiz,
    this.armolKamiz,
    this.neckFrontKamiz,
    this.neckBackKamiz,
    this.lengthSalwar,
    this.moriSalwar,
    this.beltSalwar,
    this.lengthPant,
    this.moriPant,
    this.kneePant,
    this.thighPant,
    this.kamarPant,
    this.beltPant,
    this.chainPant,
    this.pocketsPant,
  });

  factory SizeModel.fromDocument(DocumentSnapshot doc) {
    return SizeModel(
      lengthKamiz: doc["lengthKamiz"],
      chestKamiz: doc["chestKamiz"],
      kamarKamiz: doc["kamarKamiz"],
      hipKamiz: doc["hipKamiz"],
      gheraKamiz: doc["gheraKamiz"],
      baajuKamiz: doc["baajuKamiz"],
      baajuMoriKamiz: doc["baajuMoriKamiz"],
      armolKamiz: doc["armolKamiz"],
      neckFrontKamiz: doc["neckFrontKamiz"],
      neckBackKamiz: doc["neckBackKamiz"],
      lengthSalwar: doc["lengthSalwar"],
      moriSalwar: doc["moriSalwar"],
      beltSalwar: doc["beltSalwar"],
      lengthPant: doc["lengthPant"],
      moriPant: doc["moriPant"],
      kneePant: doc["kneePant"],
      thighPant: doc["thighPant"],
      kamarPant: doc["kamarPant"],
      beltPant: doc["beltPant"],
      chainPant: doc["chainPant"],
      pocketsPant: doc["pocketsPant"],
      imageUrl: doc["imageUrl"],
    );
  }
}
