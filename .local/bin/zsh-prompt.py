import sys

color_named = "blue"
color_series = "green"

def colored(color, string):
    return "%F{" + str(color) + "}" + str(string) + "%f"

def build_path(starts_from_home, folders):
    s = ""

    if starts_from_home:
        s = "~"

    index = 0
    while index < len(folders):
        folder = folders[index]
        if has_bucket_name(folder):
           index, folder = find_bucket(index, folders)
           folder = colored(color_named, "(" + folder + ")")
           index = index - 1
        elif has_series_name(folder):
            folder = colored(color_series, folder)
        s = s + "/" + folder + "%f"
        index = index + 1

    return s

def has_bucket_name(folder):
    parts = folder.split(" ")

    if len(parts) == 1:
        return False

    if not parts[0].isnumeric():
        return False

    if not len(parts[0]) == 3:
        return False

    return True

def find_bucket(index, folders):
    s = folders[index]

    while has_bucket_name(folders[index]):
        s = folders[index]
        index = index + 1

        if index >= len(folders):
            break

    return index, s

def has_series_name(folder):
    parts = folder.split(" ")

    if len(parts) == 1:
        return False

    if parts[0][0] != "#":
        return False

    if not parts[0][1:].isnumeric():
        return False

    return True

pwd = sys.argv[1]
home = sys.argv[2]
sfh = False

if pwd.startswith(home):
    pwd = pwd[len(home):]
    sfh = True

pwd_tree = pwd.split("/")[1:]
print(build_path(sfh, pwd_tree))