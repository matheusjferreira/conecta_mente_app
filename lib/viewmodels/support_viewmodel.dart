import 'package:flutter/foundation.dart';
import '../models/support_resource.dart';
import '../services/content_service.dart';

class SupportViewModel extends ChangeNotifier {
  final ContentService _service;
  SupportViewModel(this._service);

  String _filter = 'Todos';
  String get filter => _filter;

  final List<String> filters = const [
    'Todos',
    'Apoio emocional',
    'Serviço público',
    'Atenção primária',
  ];

  List<SupportResource> get resources {
    final all = _service.getSupportResources();
    if (_filter == 'Todos') return all;
    return all.where((r) => r.type == _filter).toList();
  }

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }
}
