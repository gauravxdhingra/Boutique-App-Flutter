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

  SizeModel({
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
  });

  factory SizeModel.fromDocument(DocumentSnapshot doc) {
    return SizeModel(
      lengthKamiz: doc["length"],
      chestKamiz: doc["chest"],
      kamarKamiz: doc["kamar"],
      hipKamiz: doc["hip"],
      gheraKamiz: doc["ghera"],
      baajuKamiz: doc["baaju"],
      baajuMoriKamiz: doc["baajuMori"],
      armolKamiz: doc["armol"],
      neckFrontKamiz: doc["neckFront"],
      neckBackKamiz: doc["neckBack"],
    );
  }
}
