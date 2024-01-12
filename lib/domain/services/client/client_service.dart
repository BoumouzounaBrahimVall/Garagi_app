import 'package:dartz/dartz.dart';
import 'package:garagi_app/domain/models/failure_success.dart';

import '../../models/client_model.dart';
import '../../models/form_client_model.dart';

abstract class ClientService {
  Future<Either<Failure, ClientModel>> getClientDetails(String clientId);
  Future<Either<Failure, List<ClientModel>>> getClientList();
  Future<Either<Failure, List<ClientModel>>> getClientListBySubString(
      String substring);
  Future<Either<Failure, Success>> createClient(FormClientModel client);
  Future<Either<Failure, Success>> updateClient(ClientModel client);
  Future<Either<Failure, Success>> deleteClient(String clientId);
}
