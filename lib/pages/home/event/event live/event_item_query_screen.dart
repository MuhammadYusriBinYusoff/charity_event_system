import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class ItemQueryPage extends StatefulWidget {
  final String? id;

  const ItemQueryPage({
    super.key,
    this.id,
  });

  @override
  _ItemQueryPageState createState() => _ItemQueryPageState();
}

class _ItemQueryPageState extends State<ItemQueryPage> {
  @override
  Widget build(BuildContext context) {
    EventItemsProvider eventItem = Provider.of<EventItemsProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: Translation.itemRequestTitle.getString(context)),
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
                border: Border.all(color: Palette.black),
              ),
              columns: <DataColumn>[
                buildDataColumn(
                    'Id', MediaQuery.of(context).size.width * 0.1, 8, 0),
                buildDataColumn(Translation.itemName.getString(context),
                    MediaQuery.of(context).size.width * 0.6, 0, 0),
                buildDataColumn(Translation.itemQuantity.getString(context),
                    MediaQuery.of(context).size.width * 0.2, 0, 0),
                buildDataColumn(
                    Translation.itemUnit.getString(context), MediaQuery.of(context).size.width * 0.38, 0, 0),
                buildDataColumn(
                    Translation.itemDate.getString(context), MediaQuery.of(context).size.width * 0.3, 0, 8),
              ],
              rows: eventItem.itemDetailsList.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return DataRow(
                  cells: [
                    buildDataCell((index + 1).toString()),
                    buildDataCell(item.itemName ?? ''),
                    buildDataCell(item.itemQuantity ?? ''),
                    buildDataCell(item.itemUnit ?? ''),
                    buildDataCell(item.itemDate ?? ''),
                  ],
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
            topRight: Radius.circular(topRight),
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

  DataCell buildDataCell(String text) {
    return DataCell(
      Container(
        padding: EdgeInsets.all(Dimens.space8),
        decoration: BoxDecoration(
          border: Border.all(color: Palette.black),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
