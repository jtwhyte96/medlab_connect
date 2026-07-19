/// Wraps a paginated API list response.
class PaginatedResponse<T> {
  final List<T> items;
  final int total;
  final int page;
  final int pageSize;

  const PaginatedResponse({
    required this.items,
    required this.total,
    required this.page,
    required this.pageSize,
  });

  /// True if there are more pages to fetch.
  bool get hasNextPage => (page * pageSize) < total;

  /// Total number of pages.
  int get totalPages => (total / pageSize).ceil();

  /// Creates an empty paginated response.
  static PaginatedResponse<T> empty<T>() => PaginatedResponse<T>(
        items: const [],
        total: 0,
        page: 1,
        pageSize: 20,
      );

  PaginatedResponse<R> map<R>(R Function(T item) transform) {
    return PaginatedResponse<R>(
      items: items.map(transform).toList(),
      total: total,
      page: page,
      pageSize: pageSize,
    );
  }
}
