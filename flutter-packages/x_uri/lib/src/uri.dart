class XUri {
  XUri();

  String _uri;

  parse(String uri) {
    _uri = uri;
  }

  bool get vaild {
    return true;
  }

  vaildate() {
    if (!vaild) {
      throw Error();
    }
  }

  @override
  String toString() {
    return _uri;
  }
}
