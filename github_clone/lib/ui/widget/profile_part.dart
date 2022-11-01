import 'package:flutter/cupertino.dart';
import 'package:github_clone/core/widget/app_app_bar.dart';

import '../../../core/constants.dart';

class ProfilePart extends StatelessWidget {
  const ProfilePart({
    Key? key,
    required this.searchedName,

  }) : super(key: key);
  final String searchedName;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dividerH(),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(icProfile),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // space widget
        dividerSH(),
        //Text Widget
        Center(
          child: appTextView(
            name: 'msnmusin',
            isBold: true,
            size: 17,
          ),
        ),
        dividerH(),
        appTextView(name: '')
      ],
    );
  }
}
