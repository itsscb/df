import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/model/view_model/base_vm.dart';
import 'package:app/pb/account.pb.dart';

class AccountViewModel extends BaseViewModel {
  AccountViewModel() {
    _init();
  }
  final ApiResponse _apiResponse = ApiResponse.initial('Keine Daten');

  final BackendService _service = BackendService();
  Account? _account;

  @override
  ApiResponse get response {
    return _apiResponse;
  }

  Account? get account {
    return _account;
  }

  void _init() async {
    // super.init();
    // try {
    //   _apiResponse = ApiResponse.completed(await _service.getAccount());
    // } catch (e) {
    //   _apiResponse = ApiResponse.error(e.toString());
    // }
    // notifyListeners();
  }
}
