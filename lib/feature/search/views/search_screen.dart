import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_management_app/feature/home/widgets/user_card.dart';
import 'package:profile_management_app/feature/search/bloc/search_bloc.dart';
import 'package:profile_management_app/feature/search/bloc/search_event.dart';
import 'package:profile_management_app/feature/search/bloc/search_state.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';
import 'package:profile_management_app/shared/models/state_status_model.dart';
import 'package:profile_management_app/shared/widgets/header_widget.dart';
import 'package:profile_management_app/shared/widgets/loading_model_barrier_widget.dart'
    show LoadingModelBarrierWidget;
import 'package:profile_management_app/shared/widgets/show_snack_bar_widget.dart';
import 'package:user_api/user_api.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initialize();
    });
  }

  Future<void> initialize() async {
    final SearchBloc searchBloc = context.read<SearchBloc>();
    searchBloc.add(SearchBtnPressed(search: widget.searchQuery));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.stateStatusModel.status == Status.success &&
            state.userModelList.isEmpty) {
          showSnackBarWidget(context, "not found", Colors.redAccent);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: HelperMethods.getResponsiveHeight(context) * 0.04,
                  ),
                  HeaderWidget(
                    onTap: () {
                      context.pop();
                    },
                    iconData: Icons.arrow_back,
                    titleText: "Profiles",
                  ),

                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.userModelList.length,
                        itemBuilder: (context, index) {
                          final UserModel user = state.userModelList[index];
                          return UserCard(user: user);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            BlocBuilder<SearchBloc, SearchState>(
              buildWhen:
                  (previous, current) =>
                      previous.stateStatusModel != current.stateStatusModel,
              builder: (context, state) {
                if (state.stateStatusModel.status == Status.loading) {
                  return SizedBox(
                    width: double.infinity,
                    height: HelperMethods.getResponsiveHeight(context),
                    child: Stack(children: [LoadingModelBarrierWidget()]),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
