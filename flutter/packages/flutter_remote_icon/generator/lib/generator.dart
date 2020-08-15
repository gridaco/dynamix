import 'dart:async';
import 'package:build/build.dart';
// ignore: implementation_imports
import 'package:flutter_remote_icon/src/annotations/icon_mapper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

class IconMapperGenerator extends GeneratorForAnnotation<IconMapper> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return "// Hey! Annotation found!";
  }
}
