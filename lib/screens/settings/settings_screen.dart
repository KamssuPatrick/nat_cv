import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nat_cv/common/general/ln_airbox_icons.dart';
import 'package:nat_cv/common/general/state/app_state.dart';
import 'package:nat_cv/common/general/theme_provider.dart';
import 'package:nat_cv/common/navigation/base_navigation_screen.dart';
import 'package:nat_cv/common/navigation/bloc/navigation_bloc.dart';
import 'package:nat_cv/common/ui/bulged_in_widget.dart';
import 'package:nat_cv/common/ui/clear_focus_container.dart';
import 'package:nat_cv/common/ui/tab_indicator.dart';
import 'package:nat_cv/screens/settings/parametre_tab_screen.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:rebloc/rebloc.dart';

import 'general_tab_screen.dart';
import 'mon_cv_tab_screen.dart';

class SettingsScreen extends BaseNavigationStatefulScreen {
  SettingsScreen({Key? key}) : super( routeName: '/settings_screen');

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<TabInterface> tabs = [
      GeneralTab('Compte'),
      MonCVTab('Mon CV'),
      ParametreTab('Paramètres'),
    ];

    return Container(
      height: 500,
      width: double.infinity,
      child: ClearFocusContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // const SizedBox(height: 24),
                      Text(
                        'Settings',
                        style: theme.textTheme.headline6,
                      ),
                      const SizedBox(height: 8),
                      BulgedInWidget(
                        width: double.infinity,
                        height: 48,
                        cornerRadius: 16,
                        borderWidth: 2,
                        color: ThemeProvider.grey,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: const BubbleTabIndicator(
                            indicatorHeight: 48,
                            indicatorColor: ThemeProvider.grey,
                            tabBarIndicatorSize: TabBarIndicatorSize.tab,
                          ),
                          labelPadding: EdgeInsets.all(0),
                          controller: _controller,
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.black,
                          tabs: List.generate(
                            tabs.length,
                            (index) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    tabs[index].titleName,
                                    style: theme.textTheme.bodyText2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: tabs,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
