import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line_split = line.split("   ")
        print("{}\t{}".format(line_split[0], line_split[2].strip()))