import 'package:flutter/foundation.dart';
import '../models/educational_content.dart';
import '../services/content_service.dart';

class EducationalViewModel extends ChangeNotifier {
  final ContentService _service;
  EducationalViewModel(this._service);

  late final List<EducationalContent> _all = _service.getEducationalContents();
  String _query = '';

  String get query => _query;

  List<EducationalContent> get contents {
    if (_query.isEmpty) return _all;
    final q = _query.toLowerCase();
    return _all
        .where(
          (c) =>
              c.title.toLowerCase().contains(q) ||
              c.summary.toLowerCase().contains(q),
        )
        .toList();
  }

  void search(String value) {
    _query = value;
    notifyListeners();
  }
}
