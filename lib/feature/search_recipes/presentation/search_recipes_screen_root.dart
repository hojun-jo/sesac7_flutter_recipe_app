import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SearchRecipesScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case TapFilterButton():
                _showFilterBottomSheet(viewModel);
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }

  void _showFilterBottomSheet(SearchRecipesViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) => FilterSearchBottomSheet(
        filterState: viewModel.state.filterState,
        onFilterChange: (filterState) {
          viewModel.onAction(
            SearchRecipesAction.selectFilter(filterState),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
