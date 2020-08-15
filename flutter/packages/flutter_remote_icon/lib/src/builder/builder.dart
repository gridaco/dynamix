import 'package:build/build.dart';
import 'package:flutter_remote_icon/src/builder/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder iconMapper(BuilderOptions options) =>
    SharedPartBuilder([IconMapperGenerator()], 'icon_mapper');
