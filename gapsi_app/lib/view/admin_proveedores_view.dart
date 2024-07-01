import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../datasource/proveedores_datasource.dart';

class AdminProveedoresView extends StatefulWidget {
  const AdminProveedoresView({super.key});

  static const String routeName = '/admin';

  @override
  State<AdminProveedoresView> createState() => _AdminProveedoresViewState();
}

class _AdminProveedoresViewState extends State<AdminProveedoresView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        actions: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    height: 50,
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Expanded(
            child: Column(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    height: 50,
                    image: AssetImage('images/proveedores.png'),
                  ),
                ),
                Text("Administración de proveedores."),
                Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: "Agregar un nuevo registro de proveedor.",
                        child: Text(
                          "Agregar elemento",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ]),
                    onPressed: () {
                      _showAddProveedorDialog();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: "Imprimir un registro de proveedor.",
                        child: Text(
                          "Imprimir elemento",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ]),
                    onPressed: () {
                      _showImprimirDialog();
                    },
                  ),
                ),
              ]),
          SfDataGridTheme(
            data: const SfDataGridThemeData(
              selectionColor: Colors.blueGrey,
              headerColor: Colors.blueGrey,
            ),
            child: Expanded(
              child: SfDataGrid(
                showVerticalScrollbar: true,
                headerRowHeight: 35,
                rowHeight: 30,
                footerHeight: 60,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'indice', width: 30, label: const Text('')),
                  GridColumn(
                      columnName: 'nombre',
                      label: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'NOMBRE',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))),
                  GridColumn(
                    columnName: 'razonSocial',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'RAZON SOCIAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'direccion',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'DIRECCION',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  GridColumn(
                    width: 150,
                    columnName: 'acciones',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Acciones',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
                source: ProveedoresDatasource(context),
              ),
            ),
          )
        ])),
      ),
    );
  }

  Future<void> _showAddProveedorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar registro de proveedor'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(),
                TextField(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Registrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showImprimirDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Imprimir registro'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    "Se generará un archivo PDF con la información del proveedor seleccionado.")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Registrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
