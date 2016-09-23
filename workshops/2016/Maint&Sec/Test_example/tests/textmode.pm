use strict;
use parent 'basetest';

use testapi;

sub run {
    assert_screen 'desktop', 90;
    send_key 'ctrl-alt-f4';
    wait_still_screen;
    type_string "root\n", 1;
    type_password "nots3cr3t\n", 1;
    assert_screen 'loggedin';
    type_string "echo 'Hello World!' > /dev/ttyS0";
    my $ret = wait_serial qr/Hello.*/;
    diag $ret;
}

1;
