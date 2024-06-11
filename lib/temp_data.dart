import 'product_items.dart';

const List<String> categoriesList = [
  'Пицца',
  'Паста',
  'Супы',
  'Горячие блюда',
  'Салаты',
  'Закуски',
  'Гарниры',
  'Напитки',
  'Десерты',
  'Хлеб',
  'Детское Меню'
];

List<Map<String, dynamic>> disheslist = [
{'name': 'Пицца "Паперони"', 'quantity': 1, 'price':13.00},
{'name': 'Ньокки с королевскими креветками ',  'quantity': 1, 'price': 23.00},
{'name': 'Лингвини с утиным филе в сливочном соусе с пармезаном ', 'quantity': 1, 'price':21.00},
{'name': 'Суп-крем из белых грибов и шампиньонов', 'quantity': 2, 'price':22.00},
{'name': 'Стейк из свиной шеи с запечённым картофелем и кисло-сладким соусом', 'quantity': 2, 'price':31.00},
{'name': 'Скалопини из говядины со сливочным сыром и цуккини-гриль', 'quantity': 2, 'price':32.00},
{'name': 'Салат с семгой и рукколой', 'quantity': 2, 'price':22.00},
{'name': 'Нести 0.5л зелёный чай', 'quantity': 2, 'price':3.50},
];

final List<Product> productsList = [
  Product(
    imageUrl:
    'https://st.bork.ru/recipes/vypechka-i-deserty/neapolitanskaya-pizza/2.jpg',
    itemName: 'Скалопини из говядины со сливочным сыром и цуккини-гриль',
    price: '18.00 руб',
    description: 'Тесто, пелати, моцарелла, пеперони, дор блю',
    weight: '450 гр',
    additionalInfo: 'Additional information about Dish 1.',
  ),
  Product(
    imageUrl:
    'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
    itemName: "Пицца с грушей",
    price: '20.00 руб',
    description: 'Груша, горганзола, соус песто.',
    weight: '460 г.',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  Product(
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5_5AMrUzaYoQKfq1LujfVvVci6Sicz__XChH-cmDw8FF4eHBGyPI2zZbzBaIk42o-6vI&usqp=CAU',
    itemName: "Пицца 'Деревенская'",
    price: '17.00 руб',
    description:
    'Тесто, пелати, моцарелла, салями, огурец солёный, лук синий, орегано',
    weight: '500 г.',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  Product(
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5_5AMrUzaYoQKfq1LujfVvVci6Sicz__XChH-cmDw8FF4eHBGyPI2zZbzBaIk42o-6vI&usqp=CAU',
    itemName: "Пицца “Гавайская”",
    price: '17.00 руб',
    description: 'Куриное филе, помидор, ананас.',
    weight: '520 гр',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  Product(
    imageUrl:
    'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
    itemName: "Пицца “Борджия”",
    price: '18.00руб',
    description: 'Тесто, пелати, бекон, лук карамель, песто, моцарелла',
    weight: '460 гр',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  Product(
    imageUrl:
    'https://s1.eda.ru/StaticContent/Photos/120131085624/171213000301/p_O.jpg',
    itemName: "Пицца “Фунги”",
    price: '17.00 руб.',
    description: 'Груша, горганзола, соус песто.',
    weight: '500 гр',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  Product(
    imageUrl:
    'https://pizzamarkoni.by/wp-content/uploads/2018/11/Picca-s-grushej-i-gorgonzoloj-foto-4-300x300.jpg',
    itemName: "Пицца “Меланзане”",
    price: '18.00 руб.',
    description: 'Перец вяленый, цукини гриль, баклажаны, сыр сливочный, оливковое масло.',
    weight: '490 гр',
    additionalInfo: 'Additional information about Dish 2.',
  ),
  // Add more products here
];