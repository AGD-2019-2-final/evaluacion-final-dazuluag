import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line_split = line.split("\t")
        keys_split = line_split[1].strip().split(",")
        number_str = line_split[0].strip(); number_int = int(number_str)
        number_str = ("0" + number_str) if number_int < 10 else number_str
        for key in keys_split:
            print("{}{}\t{}\t{}".format(key,number_str,key,str(number_int)))