#!/usr/bin/env python

import pyautogui
import i3ipc
import sys

SCREEN_WIDTH,SCREEN_HEIGHT = pyautogui.size()
WINDOW_WIDTH = str(int(float(SCREEN_WIDTH) * float(sys.argv[1]) * 0.01))
WINDOW_HEIGHT = str(int(float(SCREEN_HEIGHT) * float(sys.argv[2]) * 0.01))
WINDOW_COMMAND = 'move position absolute center, resize set ' + WINDOW_WIDTH + ' ' + WINDOW_HEIGHT

#print(WINDOW_WIDTH,WINDOW_HEIGHT)
#print(WINDOW_COMMAND)

def window_resize(i3, event):
    event.container.command(WINDOW_COMMAND)

i3 = i3ipc.Connection()
i3.on('window::float', window_resize)

i3.main()


