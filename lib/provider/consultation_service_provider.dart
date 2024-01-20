import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';
import 'package:garagi_app/domain/services/consultation/http_consultation_service.dart';

class ConsultationServiceProvider extends ChangeNotifier {
  final _consultationService = HttpConsultationService();
  String messageStatus = '';
  bool isLoading = false;
  List<ConsultationModel> _consultations = [];
  List<ConsultationModel> get consultations => _consultations;
  ConsultationModel _consultation = ConsultationModel();
  ConsultationModel get consultation => _consultation;

  Future<void> saveConsultation(ConsultationModel form) async {
    final result = await _consultationService.saveConsultation(form);
    messageStatus = result.fold((l) => l.message, (r) => r.message);
  }

  Future<void> getConsultations() async {
    isLoading = true;
    final result = await _consultationService.getConsultations();
    result.fold((l) => messageStatus = l.message, (r) => _consultations = r);
    isLoading = false;
    notifyListeners();
  }
}
