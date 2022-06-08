import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmploieModel {
  int? id;
  String? nom_emploi;
  String?  tache_emploie;
  List<dynamic>? meta;

  EmploieModel({
    this.id,
    this.nom_emploi,
    this.tache_emploie,
    this.meta
  });

  factory EmploieModel.fromJson(Map<String, dynamic> json) {
    print('Response bodqsdqsy 200 __:}');
    return EmploieModel(
        id: json['id'] as int,
        nom_emploi: json['name'] as String,
        tache_emploie: json['content'] as String,
        meta: json['meta'] as List<dynamic>,
    );
  }
}