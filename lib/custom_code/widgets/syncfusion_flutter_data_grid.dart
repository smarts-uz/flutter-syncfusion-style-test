// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '/actions/actions.dart' as action_blocks;
// import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SyncfusionFlutterDataGrid extends StatefulWidget {
  const SyncfusionFlutterDataGrid({
    Key? key,
    this.width,
    this.height,
    this.customers,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CustomersRow>? customers;

  @override
  _SyncfusionFlutterDataGridState createState() =>
      _SyncfusionFlutterDataGridState();
}

class _SyncfusionFlutterDataGridState extends State<SyncfusionFlutterDataGrid> {
  late List<CustomersRow> customers;
  late CustomersDataSource customersDataSource;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    customers = widget.customers ?? [];
    customersDataSource = CustomersDataSource(customersData: customers);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // final CustomColumnSizer _customColumnSizer = CustomColumnSizer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                List<CustomersRow> sortedCustomers = customers.where(
                  (customer) {
                    return customer.name!.toLowerCase().contains(
                          value.toLowerCase(),
                        );
                  },
                ).toList();
                setState(() {
                  customersDataSource = CustomersDataSource(
                    customersData: sortedCustomers,
                  );
                });
              },
            ),
          ),
          SfDataGridTheme(
            data: SfDataGridThemeData(headerColor: const Color(0xff009889)),
            child: SfDataGrid(
              // columnWidthMode: ColumnWidthMode.fitByColumnName,
              columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
              source: customersDataSource,
              allowSorting: true,
              columns: <GridColumn>[
                GridColumn(
                    columnName: 'id',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: Text(
                          'ID',
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'created_at',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Created Date',
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'name',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Name',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'job',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Job',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'email',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Email',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'salary',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Salary',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomersDataSource extends DataGridSource {
  CustomersDataSource({required List<CustomersRow> customersData}) {
    _customersData = customersData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<DateTime>(
                  columnName: 'created_at', value: e.createdAt),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'job', value: e.job),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _customersData = [];

  @override
  List<DataGridRow> get rows => _customersData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(
          e.value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList());
  }
}

class CustomColumnSizer extends ColumnSizer {
  @override
  double computeCellWidth(GridColumn column, DataGridRow row, Object? cellValue,
      TextStyle textStyle) {
    if (column.columnName == 'DOB') {
      cellValue = DateFormat.yMMMMd('en_US').format(cellValue as DateTime);
    } else if (column.columnName == 'Salary') {
      cellValue =
          NumberFormat.simpleCurrency(decimalDigits: 0).format(cellValue);
    }

    return super.computeCellWidth(column, row, cellValue, textStyle);
  }
}
