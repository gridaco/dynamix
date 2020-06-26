import re
import requests

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
    for l in source_text.split("\n"):
        if icon_data_detector_token in l:
            icon_name = re.search(r'static const IconData (.*?) = IconData\(', l).group(1)
            print(icon_name, l)
    ...


if __name__ == "__main__":
    parse()
