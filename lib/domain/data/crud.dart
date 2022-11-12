abstract class CRUD<T> {
  const CRUD();

  Future<T> find(int id);
  Future<List<T>> findMany(Set<int> ids);
  Future<List<T>> all();
  Future<T> updateOrCreate(T object);
  Future<void> delete(int id);
  Future<void> deleteAll();
}
