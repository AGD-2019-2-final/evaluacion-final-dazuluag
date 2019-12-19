import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    currkey = None
    currmax = 0
    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)
        if key == currkey:
            currmax = val if val > currmax else currmax
        else:
            if currkey is not None:
                print("{}\t{}".format(currkey, currmax))
            currkey = key
            currmax = val
    print("{}\t{}".format(currkey, currmax))