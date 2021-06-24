@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(Store.reducer, Store.initialState)

  React.useEffect1(() => {
    dispatch(
      Store.AddRecipe({
        title: "Bread",
        ingredients: "flour, salt, water, yeast",
        instructions: "Mix, let rise overnight, back at 400",
      }),
    )
    dispatch(Store.AddTag({recipeTitle: "Bread", tag: "carbs"}))
    None
  }, [dispatch])

  let url = RescriptReactRouter.useUrl()

  let component = switch url.path {
  | list{"recipes", "add"} => <div> {React.string("Add Recipe")} </div>
  | list{"recipes", title} => <div> <ViewRecipe state title /> </div>
  | list{"tags", tag} => {
      let recipesOption = state.tags->Belt.Map.String.get(tag)
      switch recipesOption {
      | Some(recipes) => <div> <RecipeList recipes /> </div>
      | None => <div> {React.string("no recipe")} </div>
      }
    }
  | list{"tags"} => <AllTags tags={state.tags} />
  | list{} => <div> {React.string("Home Page")} </div>
  | _ => <div> {React.string("Route not found")} </div>
  }

  <div> <NavBar /> {component} </div>
}
