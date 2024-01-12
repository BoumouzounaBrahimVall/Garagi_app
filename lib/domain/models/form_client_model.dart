import 'client_model.dart';
import 'compte_model.dart';

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

  String get fullName => '${nom!} ${prenom!}';
  toClientModel() {
    return ClientModel(
        fullName: fullName,
        compte: CompteModel(email: email, phoneNumber: phone));
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'nom: $nom, prenom: $prenom, email: $email, phone: $phone';
  }
}
