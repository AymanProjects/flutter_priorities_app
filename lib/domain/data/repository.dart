abstract class IRepository<T> {
  const IRepository();

  Future<T> find(int id);
  Future<List<T>> findMany(Set<int> ids);
  Future<List<T>> all();
  Future<T> createOrUpdate(T object);
  Future<void> delete(int id);
  Future<void> deleteAll();
}
