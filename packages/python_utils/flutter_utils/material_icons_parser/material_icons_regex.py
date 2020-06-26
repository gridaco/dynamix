import re
import requests
import json

# "https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/icons.dart"
flutter_material_icons_dart_source = "https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/lib/src/material/icons.dart"

### example. from the dart file via http request
###   /// <i class="material-icons md-36">replay</i> &#x2014; material icon named "replay".
###  static const IconData replay = IconData(0xe042, fontFamily: 'MaterialIcons');
###
###  /// <i class="material-icons md-36">replay_10</i> &#x2014; material icon named "replay 10".
###  static const IconData replay_10 = IconData(0xe059, fontFamily: 'MaterialIcons');
###  /// <i class="material-icons md-36">replay_30</i> &#x2014; material icon named "replay 30".
###  static const IconData replay_30 = IconData(0xe05a, fontFamily: 'MaterialIcons');

icon_data_detector_token = "static const IconData "


def parse():
    r = requests.get(flutter_material_icons_dart_source)
    source_text = r.text
    spec = []
    for l in source_text.split("\n"):
        if icon_data_detector_token in l:
            # >> IconData(code_point, font_family) from flutter's material icon
            icon_name = re.search(r'static const IconData (.*?) = IconData\(', l).group(
                1)  # todo replace with string formatting
            icon_font_family = "MaterialIcons"  # this is static, no need to parse
            icon_code_point_text = re.search(r'IconData\((.*?), fontFamily:', l).group(
                1)  # todo replace with string formatting
            icon_code_point = int(icon_code_point_text, 16)
            # print(icon_name, icon_code_point, icon_font_family)
            spec.append({
                "name": icon_name,
                "code_point": icon_code_point,
                "font_family": icon_font_family
            })
    return spec


def update_spec_file():
    spec_file_dir = "flutter_material_icon_specs.json"
    spec = parse()
    with open(spec_file_dir, "w") as f:
        json.dump(spec, f, ensure_ascii=True, indent=4, sort_keys=True)
    print(spec)
    print(f"file saved.. {spec_file_dir}")


# generates icon_name: IconData mapped dart code
def mappings_gen():
    spec = parse()
    for s in spec:
        name = s["name"]
        built_icon_data_reference = f"Icons.{name}"
        print(f"""
"{name}": {built_icon_data_reference},
""")


if __name__ == "__main__":
    mappings_gen()
