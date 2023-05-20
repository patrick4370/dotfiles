#!/usr/bin/env python

from sys import argv
from gi.repository import Gio

app = argv[1]
glauncher = Gio.DesktopAppInfo.new_from_filename(app)
for mtype in Gio.AppInfo.get_supported_types(glauncher):
    ghandler = Gio.AppInfo.get_default_for_type(mtype, False)
    launcher = glauncher.get_executable()
    handler = ghandler.get_executable()
    if launcher == handler:
        print (mtype)

