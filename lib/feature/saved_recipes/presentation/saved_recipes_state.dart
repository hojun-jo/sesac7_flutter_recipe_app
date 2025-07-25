import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "saved_recipes_state.freezed.dart";

@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> savedRecipes,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _SavedRecipesState;
}
