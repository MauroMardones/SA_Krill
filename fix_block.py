import sys

targets = [
    "Size_inflection_FISHERY(2)",
    "Size_95%width_FISHERY(2)",
    "Size_inflection_FISHERY(4)",
    "Size_95%width_FISHERY(4)",
]

files = sys.argv[1:]

for fpath in files:
    with open(fpath, "r") as f:
        lines = f.readlines()

    changed = []
    out = []
    for line in lines:
        if "#" not in line:
            out.append(line)
            continue
        data_part, _, comment_part = line.partition("#")
        comment_stripped = comment_part.strip()
        matched = None
        for t in targets:
            toks = comment_stripped.split()
            if toks and toks[0] == t:
                matched = t
                break
        if not matched:
            out.append(line)
            continue
        tokens = data_part.split()
        if len(tokens) < 14:
            out.append(line)
            continue
        old_block, old_blkfxn = tokens[12], tokens[13]
        tokens[12] = "0"
        tokens[13] = "0"
        new_data = "\t".join(tokens) + "\t"
        new_line = new_data + "#\t" + comment_part.lstrip()
        if not new_line.endswith("\n"):
            new_line += "\n"
        out.append(new_line)
        changed.append((matched, old_block, old_blkfxn))

    with open(fpath, "w") as f:
        f.writelines(out)

    print(f"{fpath}: changed {len(changed)} lines -> {changed}")
