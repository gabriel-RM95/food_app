class MealItem {
  final String name;
  final String oil;
  final int calories;
  final bool sugarless;
  final int grammes;
  final double rating;
  final int reviews;
  final List<Ingredient> ingredients;
  final String image;

  MealItem(this.name, this.oil, this.calories, this.sugarless, this.grammes,
      this.rating, this.reviews, this.ingredients, this.image);
}

class Ingredient {
  final String name;
  final String description;
  final String image;

  Ingredient(this.name, this.description, this.image);
}

final List<Ingredient> ingredients = [
  Ingredient(
      'Eggplant',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Berenjena.png'),
  Ingredient(
      'Broccoli',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Brocoli.png'),
  Ingredient(
      'Corn',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Mazorca de maíz.png'),
  Ingredient(
      'Eggplant',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Berenjena.png'),
  Ingredient(
      'Broccoli',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Brocoli.png'),
  Ingredient(
      'Corn',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      'assets/01_Imágenes/Mazorca de maíz.png'),
];

final meals = [
  MealItem('Corn Cream Soup', 'Corn Oil', 23, true, 350, 4.8, 128, ingredients,
      'assets/01_Imágenes/Plato.png'),
  MealItem('Classic Corn Mousse', 'Olive Oil', 23, true, 350, 4.8, 128,
      ingredients, 'assets/01_Imágenes/Plato.png'),
  MealItem('Green Corn Salad', 'Corn Oil', 23, true, 400, 4.8, 128, ingredients,
      'assets/01_Imágenes/Plato.png'),
  MealItem('Pumpkin Soup + Corn Oil', 'Olive Oil', 23, true, 350, 4.8, 128,
      ingredients, 'assets/01_Imágenes/Plato.png'),
  MealItem('Specialty Mix', 'Corn Oil', 23, true, 350, 4.8, 128, ingredients,
      'assets/01_Imágenes/Plato.png'),
];
