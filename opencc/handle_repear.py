input_file = "emoji.txt"
output_file = "output.txt"

# 读取输入文件并将每一行分割成两个部分
with open(input_file, "r", encoding="utf-8") as f:
    lines = [line.strip().split("\t") for line in f]

# 使用一个字典来存储条目和对应的表情符号列表
entries = {}
for line in lines:
    entry = line[0]
    emoji = line[1]
    if entry not in entries:
        entries[entry] = []
    entries[entry].append(emoji)

# 将条目和对应的表情符号列表写入输出文件中
with open(output_file, "w", encoding="utf-8") as f:
    for entry, emojis in entries.items():
        line = f"{entry}\t{' '.join(emojis)}\n"
        f.write(line)