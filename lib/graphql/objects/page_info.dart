// lib/graphql/objects/page_info.dart

/// This is an object representing information about a page returned by the Lightspark API.
/// For more information, please see the “Pagination” section of our API docs for more information about its usage.
class PageInfo {
  final bool? hasNextPage;
  final bool? hasPreviousPage;
  final String? startCursor;
  final String? endCursor;

  PageInfo({
    this.hasNextPage,
    this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      hasNextPage: json['page_info_has_next_page'] as bool?,
      hasPreviousPage: json['page_info_has_previous_page'] as bool?,
      startCursor: json['page_info_start_cursor'] as String?,
      endCursor: json['page_info_end_cursor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page_info_has_next_page': hasNextPage,
      'page_info_has_previous_page': hasPreviousPage,
      'page_info_start_cursor': startCursor,
      'page_info_end_cursor': endCursor,
    };
  }
}

const String FRAGMENT = '''
fragment PageInfoFragment on PageInfo {
    __typename
    page_info_has_next_page: has_next_page
    page_info_has_previous_page: has_previous_page
    page_info_start_cursor: start_cursor
    page_info_end_cursor: end_cursor
}
''';
