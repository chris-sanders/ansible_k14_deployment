#!/bin/bash
kapp deploy -a metallb -n kapp --into-ns {{ ytt.metallb.namespace }} -f manifest

