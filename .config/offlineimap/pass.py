#! /usr/bin/env python2
from subprocess import check_output

def passcmd(cmd):
    return check_output(cmd, shell=True).splitlines()[0]
