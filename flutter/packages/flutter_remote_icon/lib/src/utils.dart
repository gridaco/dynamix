bool isValidUri(String uri) {
  // todo: consider updating logic using URI#parse
  if (uri != null && uri.isNotEmpty) {
    return uri.contains("://");
  }
  return false;
}

/// parses the schema from given uri
String namespaceFromUri(String uri) {
  return Uri.parse(uri).scheme;
}

/// [isValidResourceUrl] is a function for checking the given url (resource) is valid. for loading
bool isValidResourceUrl(String resource) {
  // todo: some additional logic might be also helpful.
  return Uri.parse(resource).isAbsolute;
}
