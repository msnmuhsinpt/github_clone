import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/core/constants.dart';
import 'package:github_clone/core/widget/app_app_bar.dart';
import 'package:github_clone/ui/blocs/user_details/user_details_bloc.dart';

import '../../data/service/api_service.dart';

class RepoPart extends StatefulWidget {
  const RepoPart({Key? key, required this.searchedName}) : super(key: key);
  final String searchedName;

  @override
  State<RepoPart> createState() => _RepoPartState();
}

class _RepoPartState extends State<RepoPart> {
  late UsersDetailsBloc usersDetailsBloc;
  String repoName = '';

  @override
  void initState() {
    super.initState();
    usersDetailsBloc =
        UsersDetailsBloc(RepositoryProvider.of<APIService>(context));
    //url
    usersDetailsBloc.add(UserDetailsApiEvent(widget.searchedName));
    log('nameRE>>>${widget.searchedName}');
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => usersDetailsBloc,
      child: Column(
        children: [
          BlocConsumer<UsersDetailsBloc, UsersDetailsState>(
            listener: (context, state) {
              if (state is UserDetailsLoadedState) {}
            },
            builder: (context, state) {
              if (state is NoInternetState) {
                return Center(
                  child: appTextView(name: "NO Internet"),
                );
              }
              if (state is UserDetailsLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is UserDetailsLoadedState) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) => repoCard(
                      repoName,
                    ),
                    separatorBuilder: (context, index) => dividerSH(),
                  ),
                );
              }
              if (state is ErrorState) {
                log("Error>>>>>>");
                return Center(
                  child: appTextView(name: "NO User In this name"),
                );
              }
              if (state is UserDetailsLoadedState) {
                log("UN>>>>>>");
                return Center(
                  child: appTextView(name: 'Error state'),
                );
              } else {
                log("Else>>>>>>");
                return Center(
                  child: appTextView(name: 'Pleases search Name'),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget repoCard(
    String repoName,
  ) {
    return InkWell(
      child: SizedBox(
        height: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(width: 0.5),
          ),
          child: Center(
            child: appTextView(name: repoName, isBold: true, size: 18),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
