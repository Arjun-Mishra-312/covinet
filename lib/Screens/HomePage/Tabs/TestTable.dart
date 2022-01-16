import 'package:flutter/material.dart';

class TestTable extends StatefulWidget {
  @override
  _TestTableState createState() => _TestTableState();
}

class _TestTableState extends State<TestTable> {
  List<Map> _data = [
    {
      'name': 'RiteAids',
      'date': '09/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Walmart',
      'date': '80/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Walmart',
      'date': '07/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'positive': 'no'
    },
  ];

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
      dividerThickness: 5,
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
      DataColumn(label: Text('Positive?'))
    ];
  }

  List<DataRow> _createRows() {
    return _data
        .map((data) => DataRow(cells: [
              DataCell(Text(data['name'].toString())),
              DataCell(Text(data['date'])),
              DataCell(Text(data['location'])),
              DataCell(Text(data['positive']))
            ]))
        .toList();
  }
}
