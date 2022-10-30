abstract class CRUD<T> {
  const CRUD();

  Future<T> find(String id);
  Future<List<T>> all();
  Future<T> updateOrCreate(T object);
  Future<void> delete(String id);
  Future<void> deleteAll();
}
