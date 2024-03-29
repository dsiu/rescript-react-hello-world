// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";
import * as Belt_MapString from "bs-platform/lib/es6/belt_MapString.js";

var initialState = {
  recipes: undefined,
  tags: undefined
};

function reducer(state, action) {
  if (action.TAG === /* AddRecipe */0) {
    var title = action.title;
    return {
            recipes: Belt_MapString.set(state.recipes, title, {
                  title: title,
                  ingredients: action.ingredients,
                  instructions: action.instructions,
                  tags: []
                }),
            tags: state.tags
          };
  }
  var tag = action.tag;
  var recipeOption = Belt_MapString.get(state.recipes, action.recipeTitle);
  if (recipeOption === undefined) {
    return state;
  }
  var recipeTags = Belt_Array.concat(recipeOption.tags, [tag]);
  var recipes = Belt_MapString.set(state.recipes, recipeOption.title, {
        title: recipeOption.title,
        ingredients: recipeOption.ingredients,
        instructions: recipeOption.instructions,
        tags: recipeTags
      });
  var tags = Belt_MapString.update(state.tags, tag, (function (taggedRecipesOption) {
          if (taggedRecipesOption !== undefined) {
            return Belt_Array.concat(taggedRecipesOption, [recipeOption.title]);
          } else {
            return [recipeOption.title];
          }
        }));
  return {
          recipes: recipes,
          tags: tags
        };
}

export {
  initialState ,
  reducer ,
  
}
/* No side effect */
