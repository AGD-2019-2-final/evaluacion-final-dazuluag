import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    currkey = None
    currmin = 0; currmax = 0
    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        if currkey == key:
            currmin = val if val < currmin else currmin
            currmax = val if val > currmax else currmax
        else:
            if currkey is not None:
                print("{}\t{}\t{}".format(currkey, currmax, currmin))
            currkey = key
            currmin = val
            currmax = val
    print("{}\t{}\t{}".format(currkey, currmax, currmin))