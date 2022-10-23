import 'package:flutter/material.dart';
import 'package:responsive_dashboard/core/constants/padding_constants.dart';

import '../../../model/my_files.dart';
import '../../../responsive.dart';
import 'file_info_card.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingCostants.instance.midPaddingSize * 1.5,
                  vertical: PaddingCostants.instance.midPaddingSize,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: PaddingCostants.instance.midPaddingSize),
        Responsive(
          mobile: MyFilesGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
            // childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          desktop: MyFilesGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
          tablet: MyFilesGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        )
      ],
    );
  }
}

class MyFilesGridView extends StatelessWidget {
  const MyFilesGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: PaddingCostants.instance.midPaddingSize,
        crossAxisSpacing: PaddingCostants.instance.midPaddingSize,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiels[index]),
    );
  }
}
