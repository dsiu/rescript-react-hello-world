open Belt

type recipe = {
  title: string,
  ingredients: string,
  instructions: string,
  tags: array<string>,
}

type state = {
  recipes: Map.String.t<recipe>,
  tags: Map.String.t<array<string>>,
}

let initialState: state = {
  recipes: Map.String.empty,
  tags: Map.String.empty,
}

type action =
| AddRecipe({title: string, ingredients: string, instructions: string})
| AddTag({recipeTitle: string, tag:string})

let reducer = (state: state, action: action) => {
  switch action {
  | AddRecipe({title, ingredients, instructions}) => {
    recipes: state.recipes -> Map.String.set(title, {title, ingredients, instructions, tags:[]}),
    tags: state.tags,
  }

  | _ => initialState
  }
}
