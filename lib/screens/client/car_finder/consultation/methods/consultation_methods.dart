import '../../../../../domain/models/consultation_model.dart';

String consultationSvgPath(ConsultationType type_) {
  switch (type_) {
    case ConsultationType.diagnostic:
      return 'assets/svg/diagnostic_svg.svg';
    case ConsultationType.reparation:
      return 'assets/svg/reparation_svg.svg';
    default:
      return 'assets/svg/vidange_svg.svg';
  }
}

String consultationTitle(ConsultationType type_) {
  switch (type_) {
    case ConsultationType.diagnostic:
      return 'Diagnostic';
    case ConsultationType.reparation:
      return 'Reparation';
    default:
      return 'Vidange';
  }
}
