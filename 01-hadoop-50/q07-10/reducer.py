import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line_split = line.split("\t")
        print("{}   {}   {}".format(line_split[1],line_split[2],line_split[3].strip()))