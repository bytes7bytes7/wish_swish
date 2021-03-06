import '../models/models.dart';

const category1 = 'categoryID1';
const category2 = 'categoryID2';
const category3 = 'categoryID3';
const category4 = 'categoryID4';

final categories = [
  Category(
    id: category1,
    title: 'Овощи',
    amountOfProducts: products1.length,
    image:
        'https://img.freepik.com/free-photo/healthy-vegetables-on-wooden-table_1150-38014.jpg?w=2000',
  ),
  Category(
    id: category2,
    title: 'Молочка',
    amountOfProducts: products2.length,
    image:
        'https://media.istockphoto.com/photos/various-fresh-dairy-products-picture-id544807136?k=20&m=544807136&s=612x612&w=0&h=iqb23gbUKWgewmunHXd_yzJbYsZDa0fMDz64Ux6OJSc=',
  ),
  Category(
    id: category3,
    title: 'Бакалея',
    amountOfProducts: products3.length,
    image: '',
  ),
  Category(
    id: category4,
    title: 'Снэки',
    amountOfProducts: products4.length,
    image:
        'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25hY2tzfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
  ),
];

const products1 = [
  Product(
    id: 'productID1',
    categoryID: category1,
    title: 'Томаты',
    rating: 1.0,
    cost: 100.5,
    image: 'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
  ),
];

const products2 = [
  Product(
    id: 'productID2',
    categoryID: category2,
    title: 'Молоко',
    rating: 2.3,
    cost: 30,
    image:
        'https://static.turbosquid.com/Preview/2019/11/15__02_27_35/1.jpg3ADAA9DC-208D-4896-925C-FD3EB5BC3D4DLarge.jpg',
  ),
  Product(
    id: 'productID3',
    categoryID: category2,
    title: 'Масло',
    rating: 3.3,
    cost: 40.33,
    image:
        'https://i5.walmartimages.com/asr/c3fa5f37-d0ea-4af8-91d9-7086723c52b8_3.6c34f9478eef670737603a02030ba8fe.jpeg',
  ),
];

const products3 = [
  Product(
    id: 'productID4',
    categoryID: category3,
    title: 'Макароны',
    rating: 4.5,
    cost: 70,
    image:
        'https://cdn.tut-prosto.ru/files/uploads/thumbnail/products/201801/824840-458x400.jpg?v=1630586477',
  ),
  Product(
    id: 'productID5',
    categoryID: category3,
    title: 'Рис',
    rating: 5.0,
    cost: 12.0,
    image: '',
  ),
  Product(
    id: 'productID6',
    categoryID: category3,
    title: 'Специи',
    rating: 3.3,
    cost: 40.33,
    image: 'https://images.wbstatic.net/c516x688/new/13830000/13832213-1.jpg',
  ),
];

const products4 = [
  Product(
    id: 'productID7',
    categoryID: category4,
    title: "Lay's",
    rating: 4.5,
    cost: 70,
    image:
        'https://www.greekflavours.com/static/f49c99151159a5d5d5b6558bd3fad8cc/73c85/lays-oregano.png',
  ),
  Product(
    id: 'productID8',
    categoryID: category4,
    title: 'Крекеры',
    rating: 5.0,
    cost: 12.0,
    image:
        'https://www.bobsredmill.com/media/catalog/product/cache/3b391e1591e1362f5e9fe6293f04dac3/1/0/1013c0105_classic_oatcrackers_f_1.jpg',
  ),
  Product(
    id: 'productID9',
    categoryID: category4,
    title: "M&M's",
    rating: 3.3,
    cost: 40.33,
    image:
        'https://cdn-img.perekrestok.ru/i/400x400-fit/xdelivery/files/bd/3b/65b0cf2137303f63311ca92d537e.jpg',
  ),
  Product(
    id: 'productID10',
    categoryID: category4,
    title: 'Oreo',
    rating: 3.3,
    cost: 40.33,
    image:
        'https://static.fix-price.ru/upload/resize_cache/iblock/bf0/1000_1000_2/bf0dadfcee797c61df80051b0eda5990.jpg',
  ),
];
