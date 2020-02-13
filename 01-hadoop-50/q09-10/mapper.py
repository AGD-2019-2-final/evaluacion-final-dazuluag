import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line_split = line.split("   ")
        number_str = line_split[2].strip(); number_int = int(number_str)
        number_str = ("0" + number_str) if number_int < 100 else number_str
        number_str = ("0" + number_str) if number_int < 10 else number_str
        print("{}\t{}\t{}\t{}".format(
            number_str, line_split[0],line_split[1],str(number_int)))