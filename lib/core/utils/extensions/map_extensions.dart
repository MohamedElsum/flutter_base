extension MapExtensions<K, V> on Map<K, V> {
  Map<K, V> merge(Map<K, V> other) => {...this, ...other};

  Map<K, V> filterKeys(bool Function(K) predicate) =>
      Map.fromEntries(entries.where((e) => predicate(e.key)));

  Map<K, V> filterValues(bool Function(V) predicate) =>
      Map.fromEntries(entries.where((e) => predicate(e.value)));

  V getOrDefault(K key, V defaultValue) => this[key] ?? defaultValue;

  Map<K, V> removeNullValues() =>
      Map.fromEntries(entries.where((e) => e.value != null));

  List<R> mapEntries<R>(R Function(K key, V value) transform) =>
      entries.map((e) => transform(e.key, e.value)).toList();
}
