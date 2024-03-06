import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PicProfilePage extends StatefulWidget {
  String? picName;
  String? picContact;
  String? picIc;
  String? picAdress;
  String? picEmail;
  String? picPassword;

  PicProfilePage({
    Key? key,
    this.picName,
    this.picContact,
    this.picIc,
    this.picAdress,
    this.picEmail,
    this.picPassword,
  }) : super(key: key);

  @override
  State<PicProfilePage> createState() =>
      _PicProfilePageState();
}

class _PicProfilePageState extends State<PicProfilePage> {
  final TextEditingController _picNameController =
      TextEditingController();
  final TextEditingController _picContactController =
      TextEditingController();
  final TextEditingController _picIcController =
      TextEditingController();
  final TextEditingController _picAdressController =
      TextEditingController();
  final TextEditingController _picEmailController =
      TextEditingController();
  final TextEditingController _picPasswordController =
      TextEditingController();


  @override
  void initState() {
    super.initState();
    _picNameController.text = widget.picName ?? '';
    _picContactController.text = widget.picContact ?? '';
    _picIcController.text = widget.picIc ?? '';
    _picAdressController.text = widget.picAdress ?? '';
    _picEmailController.text = widget.picEmail ?? '';
    _picPasswordController.text = widget.picPassword ?? '';
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile PIC"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(
                value: Dimens.space32,
              ),
              CustomTextField(
                controller: _picNameController,
                labelText: Translation.picFullname.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picContactController,
                labelText: Translation.picContact.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picIcController,
                labelText: Translation.picIcNumber.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picAdressController,
                labelText: Translation.picAdress.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picEmailController,
                labelText: Translation.picEmail.getString(context),
              ),
              SpacerV(value: Dimens.space16),
              CustomTextField(
                controller: _picPasswordController,
                labelText: Translation.picPassword.getString(context),
                obscureText: true,
              ),
              SpacerV(value: Dimens.space16),
              SizedBox(
                width: double.infinity,
                height: Dimens.space40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      String? userId = organizationUser.organizers.id;

                      Map<String, dynamic> dataToUpdate = {
                        'picName': _picNameController.text,
                        'picContact':
                            _picContactController.text,
                        'picIc': _picIcController.text,
                        'picAdress': _picAdressController.text,
                        'picEmail': _picEmailController.text,
                        'picPassword': _picPasswordController.text,
                      };

                      await organizationUser.updatePicData(
                          userId, dataToUpdate);

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                  title: '',
                                )),
                      );
                    } catch (error) {
                      print("Error: $error");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.purpleMain,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.space8),
                    ),
                  ),
                  child: Text(
                    Translation.save.getString(context),
                    style: const TextStyle(
                        color: Palette.white, fontFamily: 'Roborto'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}