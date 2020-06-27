from flutter_utils.material_icons_parser.material_icons_specs_utils import parse_as_icons_spec

# generates icon_name: IconData mapped dart code
def mappings_gen():
    spec = parse_as_icons_spec()
    for s in spec:
        name = s["name"]
        built_icon_data_reference = f"Icons.{name}"
        print(f"""
"{name}": {built_icon_data_reference},
""")


if __name__ == "__main__":
    mappings_gen()