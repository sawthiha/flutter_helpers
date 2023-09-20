part of resource_helpers;

extension FilePathResolution on FilePath  {

  Future<String> get resolvedPath async => when(
    documents: (src) async => join((await getApplicationDocumentsDirectory()).path, src),
    temporary: (src) async => join((await getTemporaryDirectory()).path, src),
    absolute: (src) => src,
  );

  

}

extension ResourcePathResolution on ResourcePath  {

  String get fileName => map<String>(
    assets: (assets) => basename(assets.src),
    file: (file) => basename(file.path.src),
    // file.src.map(
    //   documents: (documents) => basename(documents.src),
    //   temporary: (temp) => basename(temp.src),
    //   absolute: (absolute) => basename(absolute.src),
    // ),
    network: (network) => basename(network.src),
    nil: (_) => 'N/A',
  );

}
