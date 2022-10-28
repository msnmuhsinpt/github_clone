import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/core/constans.dart';
import 'package:github_clone/ui/screen/widget/profile_part.dart';

import '../../core/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
      children:  [
         const  CupertinoSearchTextField(
            backgroundColor: aLightGrey,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: aGrey,
            ),
            suffixIcon: Icon(
              Icons.close,
              color: aGrey,
            ),
            style: TextStyle(color: aWhite),
          ),
        dividerSH(),
        // profile part
        const Expanded(child: ProfilePart()),
        //repositoy part
         /// const Expanded(child: RepoPart())
      ],
    ),
        ));
  }
}
