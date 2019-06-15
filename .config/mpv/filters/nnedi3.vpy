# vim: set ft=python:

import vapoursynth as vs
core = vs.get_core()
core.nnedi3.nnedi3_rpow2(video_in, 2).set_output()
