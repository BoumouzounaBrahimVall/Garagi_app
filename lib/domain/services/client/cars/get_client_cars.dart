import 'package:dio/dio.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/car_model.dart';

Future<List<CarModel>> getClientCars() async {
  final dio = Dio();
  Response response;
  String clientId = '2';
  try {
    response = await dio.get('${AppConstants.backendUrl}/cars/$clientId');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;

      return responseData.map((item) => CarModel.fromJson(item)).toList();
    } else {
      print('Request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error: $error');
    return [];
  }
}
