use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::Camellia')
};

BEGIN {
    my $key = pack "H32", "00080000000000000000000000000000";
    my $cipher = new Crypt::Camellia $key;
    my $ciphertext = pack "H32", "048248d32a74db80daf5642417f7832a";
    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("00000000000000000000000000000000", $answer);
};

