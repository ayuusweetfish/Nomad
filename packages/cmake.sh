#!/bin/bash
if ! (return 0 2>/dev/null); then
  curl https://github.com/Kitware/CMake/releases/download/v4.0.1/cmake-4.0.1-linux-x86_64.tar.gz -O
  tar xf cmake-4.0.1-linux-x86_64.tar.gz
else
  export PATH=$NOMAD/cmake-4.0.1-linux-x86_64/bin:$PATH
fi
