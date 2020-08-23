import 'dart:async';
import 'package:build/build.dart';

// ignore: implementation_imports
import 'package:x_icon/src/annotations/icon_mapper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

class IconMapperGenerator extends GeneratorForAnnotation<IconMapper> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    // fixme make dynamic
    final String namespace = annotation.read("namespace").stringValue;

    if (element is! ClassElement) {
      final name = element.name;
      throw InvalidGenerationSourceError('Generator cannot target `$name`.',
          todo: 'Remove the IconMapper annotation from `$name`.',
          element: element);
    }

    final classElement = element as ClassElement;
    final helper = _GeneratorHelper(this, classElement, annotation, namespace);
    return helper._generate();
  }
}

class _GeneratorHelper {
  final IconMapperGenerator _generator;
  final ClassElement element;
  final ConstantReader annotation;
  final String namespace;

  _GeneratorHelper(
      this._generator, this.element, this.annotation, this.namespace);

  _generate() {
    final StringBuffer codeBuffer = StringBuffer();
    final String className = element.name;

    /// fields should be `static const` and type of `IconData`
    final elementInstanceFields = Map.fromEntries(element.fields
        .where(
            (e) => e.isStatic && e.isConst && e.type.toString() == "IconData")
        .map((e) => MapEntry(e.name, e)));

    /// convert to
    final mapperName = "_${className}Mapping";
    // region create mappings
    /// --- example ---
    /// const _CustomIconsMapping = {
    //    "namespace://CustomIcons.add_awesome": CustomIcons.add_awesome,
    //    "namespace://CustomIcons.person_awesome": CustomIcons.person_awesome,
    //  };
    var mappings = StringBuffer();
    mappings.write('''const $mapperName = ''');
    mappings.write('{');
    // region build mapping items
    elementInstanceFields.forEach((key, value) {
      /// key = field name
      /// -> "namespace://CustomIcons.add_awesome": CustomIcons.add_awesome,
      final String token = '''"$namespace://$className.$key"''';
      final String value = "$className.$key";
      mappings.write('''$token: $value,''');
    });
    // endregion build mapping items
    mappings.write('}');
    mappings.write(';');
    // endregion create mappings

    // region create fromUri function
    /// --- example ---
    /// IconData _$CustomIconsFromUri(String uri){
    //     return _CUSTOM_ICONS_MAPPING[uri];
    //  }
    final fromUriFunctionTemplate = '''
IconData _\$${className}FromUri(String uri){
  return $mapperName[uri];
}
    ''';
    // endregion create fromUri function

    codeBuffer.write(mappings.toString());
    codeBuffer.write(fromUriFunctionTemplate.toString());
    return codeBuffer.toString();
  }
}
