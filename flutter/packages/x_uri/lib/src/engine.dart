class XUri {
  final String schema;
  final String domain;
  final String subdomain;
  final Map<String, String> params;

  XUri({this.schema, this.domain, this.subdomain, this.params});

  factory XUri.fromUri() {
    return XUri();
  }
}

