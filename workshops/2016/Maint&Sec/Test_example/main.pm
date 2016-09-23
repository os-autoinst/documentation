use strict;
use autotest qw/loadtest/;
use testapi;

loadtest 'tests/boot.pm';
if (get_var('HDD_1')) {
    loadtest 'tests/textmode.pm';
}
else {
    loadtest 'tests/installation.pm';
}
1;
