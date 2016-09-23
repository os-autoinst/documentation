Maintenance workshop - OpenQA hands-on sessions

Installation ( https://github.com/os-autoinst/openQA/blob/master/docs/Installing.asciidoc )
=======================================================================
# openSUSE Tumbleweed
zypper ar -f obs://devel:openQA/openSUSE_Factory openQA

# openSUSE Leap 42.1
zypper ar -f obs://devel:openQA/openSUSE_Leap_42.1 openQA
zypper ar -f obs://devel:openQA:Leap:42.1/openSUSE_Leap_42.1 openQA-perl-modules

# SLE12-SP1
zypper ar -f obs://devel:openQA/SLE_12_SP1 openQA
zypper ar -f obs://devel:openQA:SLE-12/SLE_12_SP1 openQA-perl-modules 

# all openSUSE and SLE
zypper in openQA-client

Configuration
==========

# API keys
1) login into webui
2) ask me for operator rights
3) create API keys
4) create ~/.config/openqa/client.conf
5) echo <<EOT
[$webui_url]
key = ${key from webui}
secret = ${secret from webui}
EOT
6) try `openqa-client --host $webui_url products get`

# test storage
1) In case or remote storage mount it, or `cd /var/lib/openqa/share/tests`
2) create subdir for your DISTRI
# create basic test structure ($PWD == "/var/lib/openqa/share/tests/$DISTRI/")
`mkdir tests`
`mkdir needles`
`chmod o+w needles`

Operations
========

Schedule one job
`openqa-client --host $webui_url jobs post DISTRI=$DISTRI ARCH=x86_64  FLAVOR=DVD VERSION=Tumbleweed ISO=opensuse.iso TEST=mytest`

Schedule ISO (need test variables to be set up)
`openqa-client --host $webui_url isos post DISTRI=$DISTRI ARCH=x86_64 FLAVOR=DVD VERSION=Tumbleweed ISO=opensuse.iso`

Task list (what we manage)
======

1) boot machine (needles, send key until match, ...)
2) begin installation (send key, needle matching + timeout management)
# break 
3) test variables setup (webui)
4) reuse installed asset and dependencies

Where to go next:
https://github.com/os-autoinst/openQA
https://github.com/os-autoinst/os-autoinst
https://github.com/os-autoinst/os-autoinst-distri-opensuse
https://github.com/os-autoinst/os-autoinst-needles-opensuse
