import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    _navigationService.replaceWithProductsView();
  }
}
