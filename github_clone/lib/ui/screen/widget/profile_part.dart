import 'package:flutter/cupertino.dart';
import 'package:github_clone/core/widget/app_app_bar.dart';

import '../../../core/constans.dart';

const _imageUrl = 'https://github.com/mojombo?tab=repositories';

class ProfilePart extends StatelessWidget {
  const ProfilePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth(context),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(_imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // space widget
        dividerSH(),
        //Text Widget
        appTextView(name: 'msnmusin', isBold: true, size: 17),


      ],
    );
  }
}
