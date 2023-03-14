abstract class TeamDataSource {
  Future<int> getData();
}

class TeamDataSourceImpl implements TeamDataSource {

  @override
  Future<int> getData() {
    throw UnimplementedError();
  }
}