import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    count_five = 0
    for line in sys.stdin:
        if count_five < 6:
            count_five += 1
            line_split = line.split("\t")
            print("{}   {}   {}".format(line_split[1],line_split[2],line_split[3].strip()))