import 'package:flutter/cupertino.dart';

import '../model/proveedor_model.dart';

/***
 * Permite enlazar los campos definidos aquí, con los componentes de las vistas.
 * Con el objetivo de actualizaciones dinámicas e instantantáneas de los
 * valores/atributos de dichos elementos.
 */
class GlobalDataProvider extends ChangeNotifier {
  List<ProveedorModel> _proveedoresDataList =
      List<ProveedorModel>.empty(growable: true);

  String _version = '';

  String _welcome = '';

  List<ProveedorModel> get proveedoresDataList => _proveedoresDataList;

  String get version => _version;

  String get welcome => _welcome;

  void setProveedoresDataList(List<ProveedorModel> proveedoresDataList) {
    _proveedoresDataList = proveedoresDataList;
    notifyListeners();
  }

  void setVersion(String version) {
    _version = version;
    notifyListeners();
  }

  void setWelcome(String welcome) {
    _welcome = welcome;
    notifyListeners();
  }
}
