from gpiozero import LEDBoard
from gpiozero.tools import random_values
from signal import pause
import sys, getopt

def main(argv):

    def start_blinking(tree):

        while True:
            for led in tree:
                led.source_delay = 0.1
                led.source = random_values()

    def stop_blinking(tree):

        tree.off()

    tree = LEDBoard(*range(2,28),pwm=True)

    mode = None
    err = "xmas_tree.py --mode <start | stop>"

    try:
        opts, args = getopt.getopt(argv,"m:",["mode="])
    except getopt.GetoptError:
        print(err)
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-m", "--mode"):
            mode = arg

    if mode == 'stop':
        stop_blinking(tree)
    elif mode == 'start':
        start_blinking(tree)
    else:
        print(err)
        sys.exit(2)

main(sys.argv[1:])