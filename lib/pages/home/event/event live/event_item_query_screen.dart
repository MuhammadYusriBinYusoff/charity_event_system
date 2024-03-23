import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ItemQueryPage extends StatefulWidget {
  const ItemQueryPage({super.key});

  @override
  _ItemQueryPageState createState() => _ItemQueryPageState();
}

class _ItemQueryPageState extends State<ItemQueryPage> {
  List<List<String?>> data = [
    ['1', 'John'],
    ['2', 'Jane'],
    ['3', 'Alice'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.itemRequestTitle.getString(context)),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimens.space12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 0,
              horizontalMargin: 0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border:
                    Border.all(color: Palette.black),
              ),
              columns: <DataColumn>[
                buildDataColumn('Id', MediaQuery.of(context).size.width * 0.1,10,0),
                buildDataColumn(
                    'Descriptions', MediaQuery.of(context).size.width * 0.8,0,10),
              ],
              rows: data.map((row) {
                return DataRow(
                  cells: row.map((data) {
                    return DataCell(
                      Container(
                        padding: EdgeInsets.all(Dimens.space8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Palette.black),
                        ),
                        child: Center(child: Text(data ?? '')),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  DataColumn buildDataColumn(
      String label, double width, double topLeft, double topRight) {
    return DataColumn(
      label: Container(
        width: width,
        padding: EdgeInsets.all(Dimens.space8),
        decoration: BoxDecoration(
          color: Palette.purpleMain,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight:
                Radius.circular(topRight),
          ),
          border: const Border(
            right: BorderSide(color: Palette.black),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Palette.white),
          ),
        ),
      ),
    );
  }
}
