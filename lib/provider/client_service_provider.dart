import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/client_model.dart';
import '../domain/models/form_client_model.dart';
import '../domain/services/client/client_service.dart';
import '../domain/services/client/http_client_service.dart';
import 'client_form_provider.dart';

class ClientServiceProvider extends ChangeNotifier {
  final ClientService _clientService = HttpClientService();
  bool isLoading = false;
  String messageStatus = '';

  List<ClientModel> _clients = [];
  List<ClientModel> get clients => _clients;

  Future<void> fetchClients() async {
    final result = await _clientService.getClientList();
    result.fold((l) => messageStatus = l.message, (r) => _clients = r);

    notifyListeners();
  }

  Future<void> createClient(FormClientModel formClientModel) async {
    final result = await _clientService.createClient(formClientModel);
    result.fold(
        (l) => messageStatus = l.message, (r) => messageStatus = r.message);
    fetchClients();
    // context.read<ClientFormProvider>().resetForm();
    notifyListeners();
  }

  Future<void> filterClients(String substring) async {
    final result = await _clientService.getClientListBySubString(substring);
    result.fold((l) => messageStatus = l.message, (r) => _clients = r);
    notifyListeners();
  }
}
