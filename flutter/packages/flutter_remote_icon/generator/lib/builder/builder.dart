import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'generator.dart';

Builder iconMapper(BuilderOptions options) =>
    SharedPartBuilder([IconMapperGenerator()], 'icon_mapper');
