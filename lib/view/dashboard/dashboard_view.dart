import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard/core/constants/padding_constants.dart';

import '../../responsive.dart';
import '../../viewmodel/menu.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';
import 'components/side_menu.dart';
import 'components/storage_details.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.all(PaddingCostants.instance.midPaddingSize),
                child: Column(
                  children: [
                    const Header(),
                    SizedBox(height: PaddingCostants.instance.midPaddingSize),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              // ignore: prefer_const_constructors
                              MyFiels(),
                              SizedBox(
                                  height:
                                      PaddingCostants.instance.midPaddingSize),
                              const RecentFiles(),
                              if (Responsive.isMobile(context))
                                SizedBox(
                                    height: PaddingCostants
                                        .instance.midPaddingSize),
                              if (Responsive.isMobile(context))
                                // Sorry for wrong spelling
                                const StarageDetails(),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: PaddingCostants.instance.midPaddingSize),
                        if (!Responsive.isMobile(context))
                          const Expanded(
                            flex: 2,
                            child: StarageDetails(),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
