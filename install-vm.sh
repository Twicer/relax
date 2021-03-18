#!/bin/bash
sudo apt update
sudo apt -y install git
git clone https://github.com/Twicer/relax.git
python3 -m http.server 8080 &
