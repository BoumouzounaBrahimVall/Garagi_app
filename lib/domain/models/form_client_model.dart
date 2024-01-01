class FormClientModel {
  String? nom;
  String? prenom;
  String? email;
  String? phone;

  FormClientModel(
      {this.nom = '', this.prenom = '', this.email = '', this.phone = ''});

  bool isValid() {
    return nom != '' && prenom != '' && email != '' && phone != '';
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'nom: $nom, prenom: $prenom, email: $email, phone: $phone';
  }
}
