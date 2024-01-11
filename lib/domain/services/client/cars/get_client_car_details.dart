import 'package:dio/dio.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/car_model.dart';

Future<CarModel?> getClientCarDetails(String matricule) async {
  final dio = Dio();
  Response response;
  try {
    response =
        await dio.get('${AppConstants.backendUrl}/cars/matricule/$matricule');
    if (response.statusCode == 200) {
      final responseData = response.data;
      return CarModel.fromJson(responseData);
      // return responseData.map((item) => CarModel.fromJson(item)).toList();
    } else {
      print('Request failed with status code: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error: $error');
    return null;
  }
}
