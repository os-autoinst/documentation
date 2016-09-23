use strict;

use parent 'basetest';
use testapi;

sub run {
    assert_screen 'bootscreen';
    if (get_var('HDD_1')) {
        send_key 'ret';
        return 1;
    }
    send_key 'down';
    save_screenshot;
    send_key 'ret';
}

sub test_flags {
    return { fatal => 1, important => 1, milestone => 1};
}

1;
