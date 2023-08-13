import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/defText.dart';
import '../config/constants.dart';
import '../util/func_util.dart';

class Header extends StatefulWidget {
  final VoidCallback? menuPress;
  final bool isDashboard;
  final String title;

  const Header({
    this.menuPress,
    required this.title,
    this.isDashboard = false,
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var box = GetStorage();
  Map? userData;

  @override
  void initState() {
    logKey("ASDASDDDDDD", box.read(kUserData));
    setState(() {
      userData = box.read(kUserData);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              if (widget.isDashboard)
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: widget.menuPress,
                )
              else
                IconButton(
                  splashRadius: kDefaultSPlashRadius,
                  icon: const Icon(Icons.keyboard_arrow_left_rounded),
                  onPressed: () {
                    Get.back();
                  },
                ),
              DefText(
                widget.title,
                fontWeight: FontWeight.bold,
              ).large,
            ],
          ),
        ),
        // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          // flex: 1,
          child: Container(
            // margin: EdgeInsets.only(left: kDefauiltPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.account_circle,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: DefText(
                      userData!['name'] ?? "",

                      // "ASDASDJSDBFPISDBFPISDFBSDPIFYB",
                      maxLine: 1,
                    ).normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
