import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:responsive_dashboard/core/constants/color_costants.dart';
import 'package:responsive_dashboard/core/constants/padding_constants.dart';

import '../../../responsive.dart';
import '../../../viewmodel/menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
              context.read<MenuController>().controlMenu();
            },
            icon: const Icon(Icons.menu),
          ),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: PaddingCostants.instance.midPaddingSize),
      padding: EdgeInsets.symmetric(
        horizontal: PaddingCostants.instance.midPaddingSize,
        vertical: PaddingCostants.instance.midPaddingSize / 2,
      ),
      decoration: BoxDecoration(
        color: ColorCostants.instance.secondColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: PaddingCostants.instance.midPaddingSize / 2),
              child: const Text("Angelina Joli"),
            ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: ColorCostants.instance.secondColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding:
                EdgeInsets.all(PaddingCostants.instance.midPaddingSize * 0.75),
            margin: EdgeInsets.symmetric(
                horizontal: PaddingCostants.instance.midPaddingSize / 2),
            decoration: BoxDecoration(
              color: ColorCostants.instance.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
