import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    currkey = None
    currnum = ""
    for line in sys.stdin:
        tmp, key, val = line.split("\t")
        val = val.strip()
        if currkey == key:
            currnum = "{},{}".format(currnum, val)
        else:
            if currkey is not None:
                print("{}\t{}".format(currkey, currnum))
            currkey = key
            currnum = val
    print("{}\t{}".format(currkey, currnum))