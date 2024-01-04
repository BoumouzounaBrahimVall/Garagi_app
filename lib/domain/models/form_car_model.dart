class FormCarModel {
  String? marque;
  String? modele;
  String? annee;
  String? immatriculation;
  String? clientId;

  FormCarModel(
      {this.marque,
      this.clientId,
      this.modele,
      this.annee,
      this.immatriculation});

  FormCarModel.fromJson(Map<String, dynamic> json) {
    marque = json['marque'];
    modele = json['modele'];
    annee = json['annee'];
    immatriculation = json['immatriculation'];
    clientId = json['clientId'];
  }
  bool isValid() {
    return marque != '' && modele != '' && annee != '' && immatriculation != '';
  }

  void clear() {
    marque = '';
    modele = '';
    annee = '';
    immatriculation = '';
    clientId = '';
  }

  @override
  String toString() {
    return ' marque: $marque, modele: $modele, annee: $annee, immatriculation: $immatriculation, clientId: $clientId';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['marque'] = this.marque;
    data['modele'] = this.modele;
    data['annee'] = this.annee;
    data['immatriculation'] = this.immatriculation;
    data['clientId'] = this.clientId;
    return data;
  }
}
