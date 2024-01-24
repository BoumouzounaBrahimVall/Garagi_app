import 'package:dartz/dartz.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';

import '../../models/car_details_model.dart';
import '../../models/failure_success.dart';

abstract class ConsultationService {
  Future<Either<Failure, Success>> saveConsultation(ConsultationModel form);
  Future<Either<Failure, List<ConsultationSmall>>> getConsultations();

  /* Future<List<Consultation>> getConsultations();
  Future<Consultation> createConsultation(Consultation consultation);
  Future<Consultation> updateConsultation(Consultation consultation);
  Future<void> deleteConsultation(String id);
  */
}
