import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../binding/global_data_provider.dart';

class ProveedoresDatasource extends DataGridSource {
  ProveedoresDatasource(BuildContext context) {
    GlobalDataProvider gdp =
        Provider.of<GlobalDataProvider>(context, listen: false);

    _proveedoresData = gdp.proveedoresDataList
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'nombre', value: e.nombre ?? ''),
              DataGridCell<String>(
                  columnName: 'razonSocial', value: e.razonSocial ?? ''),
              DataGridCell<String>(
                  columnName: 'razonSocial', value: e.direccion ?? ''),
            ]))
        .toList();
  }

  List<DataGridRow> _proveedoresData = [];

  @override
  List<DataGridRow> get rows => _proveedoresData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'acciones') {
        return Container(
            child: Row(children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              FaIcon(FontAwesomeIcons.download).icon,
              color: Colors.blueGrey,
            ),
          ),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                FaIcon(FontAwesomeIcons.eye).icon,
                color: Colors.blueGrey,
              ))
        ]));
      } else if (dataGridCell.columnName == 'indice') {
        return Container(
            child: Icon(
          FaIcon(FontAwesomeIcons.circle).icon,
          color: RandomColor.getColor(Options(luminosity: Luminosity.dark)),
        ));
      } else {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(dataGridCell.value.toString()),
        );
      }
    }).toList());
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
        child: Center(
      child: AutoSizeText(
        summaryValue,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }
}
