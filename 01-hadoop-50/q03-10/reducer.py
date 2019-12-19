import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line_split = line.split("\t")
        print("{},{}".format(line_split[1].strip(),line_split[0].strip()))