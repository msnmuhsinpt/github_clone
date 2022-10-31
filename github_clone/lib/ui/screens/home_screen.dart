import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/core/constants.dart';
import 'package:github_clone/ui/bloc/github_bloc/github_bloc.dart';
import '../../core/app_color.dart';
import '../../core/widget/app_app_bar.dart';
import '../../data/model/search_model.dart';
import '../../data/service/api_service.dart';
import '../widget/profile_part.dart';
import '../widget/repo_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bloc
  late GithubBloc githubBloc;

  //search
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  List<SearchModel> searchModel = [];
  List<SearchModel> tempSearchModelList = [];

  //test
  String name = ' msnmuhsin';
  String repo = 'Amazon';

  onItemChanged(String value) {
    if (value == "") {
      setState(() {
        isSearch = false;
        tempSearchModelList.clear();
      });
    } else {
      setState(() {
        isSearch = true;
        tempSearchModelList = searchModel
            .where((SearchModel data) =>
                data.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    githubBloc = GithubBloc(RepositoryProvider.of<APIService>(context));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(microseconds: 1000),
      initialIndex: 0,
      child: RepositoryProvider(
        create: (context) => githubBloc,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: BlocListener<GithubBloc, GitHubState>(
                listener: (context, state) {
                  if (state is ProfileLoadedState) {

                    searchModel.add(
                        SearchModel(name: state.response.login.toString()));
                  }
                },
                child: homeSearchBar()),
          ),
          body: TabBarView(
            children: [
              ProfilePart(
                imageUrl: icProfile,
                userName: name,
              ),
              RepoPart(itemCount: 3, repoName: repo),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeSearchBar() {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            //data fetch
            onItemChanged(value);
            setState(() {
              githubBloc.add(ProfileApiEvent(searchController.text.toString()));
            });
          },
          decoration: InputDecoration(
            fillColor: aWhite,
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 2),
            suffixIcon: IconButton(
              onPressed: () {
                isSearch ? clearSearch() : doSearch();
              },
              icon: isSearch
                  ? const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  : const Icon(Icons.search, color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1),
            ),
            hintText: 'Search....',
          ),
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        indicator: BoxDecoration(
          color: aWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: [
          Tab(
            child: appTextView(
              name: "Profile",
              isBold: true,
              size: 16,
            ),
          ),
          Tab(
            child: appTextView(
              name: 'Repository',
              isBold: true,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  ///search
  clearSearch() {
    setState(() {
      searchController.clear();
      isSearch = false;
    });
  }

  doSearch() {
    setState(() {
      onItemChanged(searchController.text.toString());
    });
  }
}
