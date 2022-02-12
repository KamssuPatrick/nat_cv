import 'package:flutter/material.dart';
import 'package:nat_cv/common/general/ln_airbox_icons.dart';
import 'package:nat_cv/common/general/theme_provider.dart';
import 'package:nat_cv/common/ui/bulged_in_widget.dart';
import 'package:nat_cv/common/ui/neumorphic_container.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:nat_cv/screens/settings/widget/label_widget.dart';
import 'package:nat_cv/screens/settings/widget/text_input_widget.dart';

import 'widget/button_widget.dart';

class MonCVTab extends TabInterface {
  MonCVTab(String titleName) : super(titleName);

  @override
  _MonCVTabState createState() => _MonCVTabState();
}

class _MonCVTabState extends State<MonCVTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final passwordTextController = TextEditingController();

  final passwordKey = GlobalKey<TextInputState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Label(labelText: 'Aucun CV trouvé'),
              Button.text(
                labelText: 'Créer mon CV',
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
