import 'package:flutter/material.dart';

class TestTable extends StatefulWidget {
  const TestTable({Key? key, required this.data}) : super(key: key);
  final List<Map<String, dynamic>> data;
  @override
  _TestTableState createState() => _TestTableState();
}

class _TestTableState extends State<TestTable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: _createDataTable(),
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      dividerThickness: 2,
      dataRowHeight: 80,
      showBottomBorder: true,
      headingTextStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Date')),
      DataColumn(label: Text('Location')),
      DataColumn(label: Text('Description')),
      DataColumn(label: Text('Positive?'))
    ];
  }

  List<DataRow> _createRows() {
    return widget.data
        .map((data) => DataRow(cells: [
              DataCell(Text(data['name'].toString())),
              DataCell(Text(data['date'])),
              DataCell(Text(data['location'])),
              DataCell(Text(data['description'])),
              DataCell(Text(data['isPositive']))
            ]))
        .toList();
  }
}
