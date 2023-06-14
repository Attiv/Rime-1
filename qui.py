input_file = "xkjd6.tangshi.dict.yaml"
output_file = "output.tangshi.dict.yaml"

with open(input_file, "r", encoding="utf-8") as f:
    lines = f.readlines()

with open(output_file, "w", encoding="utf-8") as f:
    for line in lines:
        parts = line.strip().split("\t")
        if len(parts) == 2 and parts[1].startswith("i"):
            parts[1] = parts[1][1:]
        f.write("\t".join(parts) + "\n")

print("处理完成，输出文件为:", output_file)
