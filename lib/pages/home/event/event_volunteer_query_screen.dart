import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class VolunteerQueryPage extends StatefulWidget {
  final String? id;

  const VolunteerQueryPage({
    super.key,
    this.id,
  });

  @override
  _VolunteerQueryPageState createState() => _VolunteerQueryPageState();
}

class _VolunteerQueryPageState extends State<VolunteerQueryPage> {
  @override
  Widget build(BuildContext context) {
    EventVolunteerProvider eventVolunteerFile =
        Provider.of<EventVolunteerProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
          title: Translation.volunteerOrganizerView.getString(context)),
      body: Container(
        padding: EdgeInsets.all(Dimens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Translation.volunteerInfoTitle.getString(context),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              Translation.volunteerInfoSub.getString(context),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            SpacerV(value: Dimens.space20),
            SingleChildScrollView(
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
                    buildDataColumn(
                        Translation.personnelName.getString(context),
                        MediaQuery.of(context).size.width * 0.65,
                        0,
                        0),
                    buildDataColumn(
                        Translation.personnelContact.getString(context),
                        MediaQuery.of(context).size.width * 0.4,
                        0,
                        0),
                    buildDataColumn(Translation.personnelIc.getString(context),
                        MediaQuery.of(context).size.width * 0.4, 0, 0),
                    buildDataColumn(
                        Translation.personnelAdress.getString(context),
                        MediaQuery.of(context).size.width * 0.6,
                        0,
                        0),
                    buildDataColumn(
                        Translation.personnelEmail.getString(context),
                        MediaQuery.of(context).size.width * 0.6,
                        0,
                        0),
                    buildDataColumn(Translation.action.getString(context),
                        MediaQuery.of(context).size.width * 0.2, 0, 8),
                  ],
                  rows: eventVolunteerFile.volunteerDetailsList
                      .asMap()
                      .entries
                      .map((entry) {
                    final index = entry.key;
                    final volunteer = entry.value;
                    return DataRow(
                      cells: [
                        buildDataCell((index + 1).toString()),
                        buildDataCell(volunteer.volunteerName ?? ''),
                        buildDataCell(volunteer.volunteerContact ?? ''),
                        buildDataCell(volunteer.volunteerIc ?? ''),
                        buildDataCell(volunteer.volunteerAdress ?? ''),
                        buildDataCell(volunteer.volunteerEmail ?? ''),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              eventVolunteerFile
                                  .deleteEventVolunteer(volunteer.id);
                              setState(() {
                                eventVolunteerFile.volunteerDetailsList
                                    .removeAt(index);
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
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
