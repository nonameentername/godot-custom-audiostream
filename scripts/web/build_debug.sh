#!/bin/bash

. /emsdk/emsdk_env.sh

scons platform=web target=template_debug debug_symbols=yes
