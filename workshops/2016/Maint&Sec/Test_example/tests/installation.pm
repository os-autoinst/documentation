use strict;
use parent 'basetest';

use testapi;

sub run {
    assert_screen 'welcome', 90;
    assert_and_click 'next-button';
    assert_screen 'timedate';
}

sub test_flags {
  return {important => 1};
}

1;
