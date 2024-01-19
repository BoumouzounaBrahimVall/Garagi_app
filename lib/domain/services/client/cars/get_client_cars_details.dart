import 'package:dio/dio.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/car_details_model.dart';

Future<List<CarDetailModel>> getClientCarsDetails(String clientId) async {
  final dio = Dio();
  Response response;
  try {
    response = await dio.get('${AppConstants.backendUrl}/cars/$clientId');
    if (response.statusCode == 200) {
      List<CarDetailModel> cars = (response.data as List<dynamic>)
          .map((jsonData) => CarDetailModel.fromJson(jsonData))
          .toList();
      // print(cars[0]);
      return cars;
    } else {
      print('Request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error: $error');
    return [];
  }
}
