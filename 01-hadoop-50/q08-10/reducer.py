import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    currkey = None
    total = 0; count = 0
    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        if currkey == key:
            total += val; count += 1
        else:
            if currkey is not None:
                print("{}\t{}\t{}".format(currkey, total, (total/count)))
            currkey = key
            total = val; count = 1
    print("{}\t{}\t{}".format(currkey, total, (total/count)))