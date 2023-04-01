// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../DataAccesslayer/Models/favourite.dart';
import '../../DataAccesslayer/Models/product.dart';
import '../../DataAccesslayer/Repositories/products_repo.dart';
import '../../PresentationLayer/Widgets/snackbars.dart';
import '../Helpers/box_client.dart';

class FavouriteController extends GetxController {
  ProductsRepo productRepo = ProductsRepo();
  BoxClient boxClient = BoxClient();
  List<Favourite> favoritesProducts = [];
  List<Product> products = [];

  var adding = false.obs;

  @override
  void onInit() async {
    await getFavorites();
    await syncCartsOnline();

    super.onInit();
  }

  Future<void> getFavorites() async {
    favoritesProducts = await boxClient.getFavorites();
    print(favoritesProducts);
    update();
  }

  Future<void> syncFavorites() async {
    if (products.isNotEmpty) {
      favoritesProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    update();
  }

  Future<void> syncCartsOnline() async {
    List<int> ids = favoritesProducts.map((e) => e.productId).toList();
    products = await productRepo.productsByIds(ids);
    if (products.isNotEmpty) {
      print(products);
      for (var favoriteitem in favoritesProducts) {
        favoriteitem.product = products
            .where((element) => element.id == favoriteitem.productId)
            .first;
      }
      favoritesProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    update();
  }

  Future<void> toggleFavorite(Product? product) async {
    if (product != null) {
      Favourite? index = favoritesProducts
          .firstWhereOrNull((element) => element.productId == product.id);
      if (index != null) {
        favoritesProducts
            .removeWhere((element) => element.productId == product.id);
        SnackBars.showSuccess('removeSuccessMessage'.tr);
      } else {
        var favorite = Favourite(productId: product.id);
        adding.value = true;
        products.add(product);
        favorite.product = product;
        favoritesProducts.add(favorite);
        await boxClient.addToFavorite(favoritesProducts);
        adding.value = false;
        SnackBars.showSuccess('addingSuccessMessage'.tr);
      }
      print(favoritesProducts);
      await syncFavorites();
      update();
    }
  }

  bool checkFavorite(Product product) {
    Favourite? index = favoritesProducts
        .firstWhereOrNull((element) => element.productId == product.id);
    if (index != null) {
      return true;
    }
    return false;
  }
}
