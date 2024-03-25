import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class UserFeedbackPage extends StatefulWidget {
  final String? id;

  const UserFeedbackPage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  _UserFeedbackPageState createState() => _UserFeedbackPageState();
}

class _UserFeedbackPageState extends State<UserFeedbackPage> {
  final List<String> scoreRate = ['0', '1', '2', '3', '4', '5'];
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0;
  int value5 = 0;
  int totalValue = 0;
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EventFeedbackProvider eventFeedback = Provider.of<EventFeedbackProvider>(context);
    
    return Scaffold(
      appBar:
          CustomAppBar(title: Translation.feedbackFormTitle.getString(context)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(Dimens.space16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerV(
                  value: Dimens.space32,
                ),
                CustomDropdownFormField(
                  hint: Translation.feedbackQuestion1.getString(context),
                  items: scoreRate,
                  onChanged: (value) {
                    value1 = int.parse(value ?? '0');
                  },
                  validator: (value) {
                    if (value == null) {
                      return Translation.feedbackCheck.getString(context);
                    }
                    return null;
                  },
                ),
                SpacerV(value: Dimens.space24),
                CustomDropdownFormField(
                  hint: Translation.feedbackQuestion2.getString(context),
                  items: scoreRate,
                  onChanged: (value) {
                    value2 = int.parse(value ?? '0');;
                  },
                  validator: (value) {
                    if (value == null) {
                      return Translation.feedbackCheck.getString(context);
                    }
                    return null;
                  },
                ),
                SpacerV(value: Dimens.space24),
                CustomDropdownFormField(
                  hint: Translation.feedbackQuestion3.getString(context),
                  items: scoreRate,
                  onChanged: (value) {
                    value3 = int.parse(value ?? '0');;
                  },
                  validator: (value) {
                    if (value == null) {
                      return Translation.feedbackCheck.getString(context);
                    }
                    return null;
                  },
                ),
                SpacerV(value: Dimens.space24),
                CustomDropdownFormField(
                  hint: Translation.feedbackQuestion4.getString(context),
                  items: scoreRate,
                  onChanged: (value) {
                    value4 = int.parse(value ?? '0');;
                  },
                  validator: (value) {
                    if (value == null) {
                      return Translation.feedbackCheck.getString(context);
                    }
                    return null;
                  },
                ),
                SpacerV(value: Dimens.space24),
                Text(
                  Translation.feedbackQuestion5.getString(context),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SpacerV(value: Dimens.space8),
                buildTextField(
                  controller: _commentController,
                  hintText: Translation.pleaseHintText.getString(context),
                  multiLine: true,
                ),
                SpacerV(value: Dimens.space30),
                SizedBox(
                  width: double.infinity,
                  height: Dimens.space40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        totalValue = value1 + value2 + value3 + value4;
                        final newFeedback = EventFeedbackModel(
                          id: widget.id,
                          responsibilityScore: value1,
                          updateGalleryScore: value2,
                          informationUptoDateScore: value3,
                          recommendationScore: value4,
                          currentScoreCollected: totalValue,
                          comment:_commentController.text,
                        );

                        eventFeedback.createFeedbackDetails(newFeedback);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPostingDescriptionPage()),
                        );
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
                      Translation.submit.getString(context),
                      style: const TextStyle(
                          color: Palette.white, fontFamily: 'Roborto'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
