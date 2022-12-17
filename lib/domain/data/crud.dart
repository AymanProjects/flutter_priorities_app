abstract class CRUD<T extends Object> {
  const CRUD();

  Future<T> find(int id);
  Future<List<T>> findMany(Set<int> ids);
  Future<List<T>> all();
  Future<List<T>> where(Map<String, dynamic> query);
  Future<T> createOrUpdate(T object);
  Future<List<T>> createOrUpdateMany(List<T> objects);
  Future<void> delete(int id);
  Future<void> deleteAll();
}
