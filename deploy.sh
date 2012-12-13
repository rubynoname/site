#!/bin/bash
middleman build && rsync -avr build/* trionet.ru:/www/rubynoname.ru/
