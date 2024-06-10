import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../services/api_service.dart';

class ProductViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  late Product _product;
  Product get product => _product;

  Future<void> fetchProduct(int id) {
    return runBusyFuture(_apiService.fetchProduct(id).then((product) {
      _product = product;
    }));
  }
}
