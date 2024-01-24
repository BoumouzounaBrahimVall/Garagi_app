class FormCarModel {
  String? marque;
  String? modele;
  String? annee;
  int? kilometrage;
  String? matricule;
  String? ownerId;

  FormCarModel(
      {this.marque,
      this.ownerId,
      this.modele,
      this.annee = "zebi",
      this.kilometrage = 0,
      this.matricule});

  FormCarModel.fromJson(Map<String, dynamic> json) {
    marque = json['marque'];
    modele = json['modele'];
    annee = json['annee'];
    matricule = json['matricule'];
    ownerId = json['clientId'];
  }
  bool isValid() {
    return marque != '' && modele != '' && annee != '' && matricule != '';
  }

  void clear() {
    marque = '';
    modele = '';
    annee = '';
    matricule = '';
    ownerId = '';
  }

  @override
  String toString() {
    return ' marque: $marque, modele: $modele, annee: $annee, immatriculation: $matricule, ownerId: $ownerId';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['marque'] = marque; // todo: not taken
    data['model'] = modele;
    data['annee'] = annee; // todo: not taken
    data['matricule'] = matricule;
    data['km'] = kilometrage;
    data['client_id'] = int.parse(ownerId!);
    return data;
  }
}
