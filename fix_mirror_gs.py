import sys, re

files = sys.argv[1:]

gs_param_names = [
    "Peak_FISHERY(3)",
    "Top_logistic_FISHERY(3)",
    "Ascend_width_FISHERY(3)",
    "Descend_width_FISHERY(3)",
    "Initial_selex_FISHERY(3)",
    "Final_selex_FISHERY(3)",
]

for fpath in files:
    with open(fpath, "r") as f:
        lines = f.readlines()

    out = []
    i = 0
    n = len(lines)
    pattern_table_changed = False
    param_block_removed = False

    while i < n:
        line = lines[i]

        # 1) Fix the LENGTH selex pattern table line for FISHERYGS: "24\t0\t0\t0\t#\t\tFISHERYGS"
        if re.match(r"^24\t0\t0\t0\t#\t*FISHERYGS", line) or (line.split("#")[0].split() == ["24","0","0","0"] and "FISHERYGS" in line):
            out.append("15\t0\t0\t1\t#\t\tFISHERYGS (mirror BS fleet 1)\n")
            pattern_table_changed = True
            i += 1
            continue

        # 2) Remove the GS domed-selectivity parameter block (header comment + 6 param lines)
        data_part, _, comment_part = line.partition("#")
        comment_stripped = comment_part.strip()
        if comment_stripped.startswith("24") and "FISHERY" in comment_stripped and "LenSelex" in comment_stripped:
            # peek ahead: is the next line's comment Peak_FISHERY(3)?
            if i + 1 < n:
                next_comment = lines[i+1].partition("#")[2].strip()
                if next_comment.split()[0] == "Peak_FISHERY(3)" if next_comment.split() else False:
                    # skip this header line and the next 6 parameter lines
                    i += 1  # skip header
                    skipped = []
                    for _ in range(6):
                        skipped.append(lines[i].partition("#")[2].strip().split()[0] if lines[i].partition("#")[2].strip() else "")
                        i += 1
                    param_block_removed = skipped
                    continue

        out.append(line)
        i += 1

    with open(fpath, "w") as f:
        f.writelines(out)

    print(f"{fpath}: pattern_table_changed={pattern_table_changed}, removed_block={param_block_removed}")
