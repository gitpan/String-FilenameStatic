#!/usr/bin/perl


use lib '../lib';

use strict;
use warnings;
use File::Spec::Functions qw( catdir );
use String::FilenameStatic qw(get_path get_file);


use Test::More tests => 2;




my $s = catdir('this','is','a','path','.any_file.html');


is( get_path($s), catdir('this','is','a','path'), 'get_path' );

is( get_file($s), '.any_file.html', 'get_file' );


1;
