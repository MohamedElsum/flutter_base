extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;

  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final key = keyFunction(element);
      (map[key] ??= []).add(element);
    }
    return map;
  }

  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size).clamp(0, length)));
    }
    return chunks;
  }

  List<T> sortedBy<R extends Comparable>(R Function(T) selector) =>
      [...this]..sort((a, b) => selector(a).compareTo(selector(b)));

  List<T> sortedByDescending<R extends Comparable>(R Function(T) selector) =>
      [...this]..sort((a, b) => selector(b).compareTo(selector(a)));

  List<T> get distinct => toSet().toList();

  List<T> distinctBy<R>(R Function(T) selector) {
    final seen = <R>{};
    return where((e) => seen.add(selector(e))).toList();
  }

  List<T> separatedBy(T separator) {
    if (length <= 1) return [...this];
    return [
      for (var i = 0; i < length; i++) ...[
        if (i > 0) separator,
        this[i],
      ],
    ];
  }
}
