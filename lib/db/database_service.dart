import 'package:grocery_app/db/database_repo.dart';
import 'package:grocery_app/model/item_model.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveItem(Item item) async {
    return await _repository!.insertData('item', item.toJson());
  }

  readItem() async {
    return await _repository!.readData('item');
  }

  deleteItem(dispatchId) async {
    return await _repository!.deleteData('item', dispatchId);
  }
}
