import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class ValidateOrganizer extends StatefulWidget {
  const ValidateOrganizer({super.key});

  @override
  State<ValidateOrganizer> createState() => _ValidateOrganizerState();
}

class _ValidateOrganizerState extends State<ValidateOrganizer> {
  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    List<OrganizerModel> notVerifiedOrganizers = organizationUser.organizerList
        .where((organizer) => organizer.verify == "Not Verified")
        .toList();

    ValueNotifier<List<OrganizerModel>> notVerifiedOrganizersNotifier =
        ValueNotifier<List<OrganizerModel>>(notVerifiedOrganizers);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Validate Organizer",
      ),
      body: ValueListenableBuilder<List<OrganizerModel>>(
        valueListenable: notVerifiedOrganizersNotifier,
        builder: (context, notVerifiedList, child) {
          return ListView.builder(
            itemCount: notVerifiedList.length,
            itemBuilder: (context, index) {
              OrganizerModel organizer = notVerifiedList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    organizationUser.updateOrganizerStatus(
                        organizer.id, "Verified");

                    setState(() {
                      notVerifiedList.removeAt(index);
                      notVerifiedOrganizersNotifier.value = notVerifiedList;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminChosen(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: Dimens.space32,
                        backgroundImage: NetworkImage(organizer
                                .profileImageLink ??
                            'https://cdn-icons-png.flaticon.com/512/7915/7915522.png'),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            organizer.organizationName ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SpacerV(
                            value: Dimens.space4,
                          ),
                          _buildDetailText(
                            context,
                            Translation.organizationContact.getString(context),
                            organizer.organizationContact ?? '',
                          ),
                          _buildDetailText(
                            context,
                            Translation.organizationNumber.getString(context),
                            organizer.organizationNumber ?? '',
                          ),
                          _buildDetailText(
                            context,
                            Translation.picFullname.getString(context),
                            organizer.picName ?? '',
                          ),
                          _buildDetailText(
                            context,
                            Translation.picContact.getString(context),
                            organizer.picContact ?? '',
                          ),
                          _buildDetailText(
                            context,
                            Translation.organizationLink.getString(context),
                            organizer.organizationLink ?? '',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget _buildDetailText(BuildContext context, String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$label: $value',
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
      SpacerV(value: Dimens.space4),
    ],
  );
}
