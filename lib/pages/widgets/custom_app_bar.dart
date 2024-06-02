import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:flutter_localization/flutter_localization.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showPreviousButton;
  final bool? hideLogout;
  final Color? appBarcolor;
  final Color? vertMoreColor;

  const CustomAppBar({Key? key, this.title, this.showPreviousButton, this.hideLogout = false, this.appBarcolor = Palette.purpleMain, this.vertMoreColor = Palette.white})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.showPreviousButton ?? true,
      backgroundColor: widget.appBarcolor,
      title: Center(
        child: Text(
          widget.title ?? '',
          style: const TextStyle(color: Palette.white, fontSize: 18),
        ),
      ),
      actions: widget.hideLogout == false ? [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Icon(
              Icons.more_vert,
              size: 28,
              color: widget.vertMoreColor,
            ),
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
              const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
              ...MenuItems.secondItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value! as MenuItem);
            },
            dropdownStyleData: DropdownStyleData(
              width: 135,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Palette.purpleMain,
              ),
              offset: const Offset(0, 8),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItems.firstItems.length, 30),
                8,
                ...List<double>.filled(MenuItems.secondItems.length, 30),
              ],
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        SpacerH(
          value: Dimens.space10,
        ),
      ] : null,
    );
  }
}


class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [home, language, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const language = MenuItem(text: 'Language', icon: Icons.language);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static EventDetailsProvider eventDetailsFile = EventDetailsProvider();
  static OrganizerProvider organizationUser = OrganizerProvider();
  static PersonnelProvider personnelUser = PersonnelProvider();
  static EventFeedbackProvider eventFeedback = EventFeedbackProvider();

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 15),
        SpacerH(
          value: Dimens.space10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: Translation.splashTitle.getString(context),
            ),
          ),
        );
        break;
      case MenuItems.settings:
        // Do something
        break;
      case MenuItems.language:
        _toggleLocale(context);
        break;
      case MenuItems.logout:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Palette.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Palette.black),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Palette.redButton),
                SpacerH(value: Dimens.space10),
                Text(
                  Translation.logOutTitle.getString(context),
                  style: const TextStyle(color: Palette.black),
                ),
              ],
            ),
            content: Text(
              Translation.logOutMsg.getString(context),
              style: const TextStyle(color: Palette.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Translation.cancel.getString(context),
                  style: const TextStyle(color: Palette.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  eventDetailsFile.resetEventDetails();
                  organizationUser.resetOrganizersDetails();
                  personnelUser.resetPersonnelsDetails();
                  eventFeedback.resetEventFeedback();
                  await eventFeedback.resetScoreEventFeedback();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Palette.redButton),
                ),
                child: Text(
                  Translation.logout.getString(context),
                  style: const TextStyle(color: Palette.white),
                ),
              ),
            ],
          ),
        );
        break;
    }
  }

  static void _toggleLocale(BuildContext context) {
    final FlutterLocalization flutterLocalization =
        FlutterLocalization.instance;
    final String currentLocale =
        flutterLocalization.currentLocale!.languageCode;
    String newLocale = currentLocale == 'en' ? 'my' : 'en';
    flutterLocalization.translate(newLocale);
  }
}
