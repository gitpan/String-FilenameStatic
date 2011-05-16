package String::FilenameStatic; ## Static functions to manipulate a filename and path.


our $VERSION='0.02';


use strict;

use vars qw(@ISA @EXPORT %EXPORT_TAGS $VERSION);
use Exporter; 
use File::Spec::Functions qw( catdir splitdir );
use File::Util qw( SL );



@ISA = qw(Exporter);

%EXPORT_TAGS = ( all => [qw(
                      get_path
                      get_file
                      remove_trailing_slash
                      get_file_extension
                      get_filename
                )] ); 

Exporter::export_ok_tags('all'); 


# This class provides static functions which can be imported to the namespace of 
# the current class.
#
#
# SYNOPSIS
# ========
# 
#  # imports all functions
#  use String::FilenameStatic ':all';
#
#  # imports only two functions
#  use String::FilenameStatic qw(get_path get_file);
#  
#
# LICENSE
# =======   
# You can redistribute it and/or modify it under the conditions of LGPL.
# 
# AUTHOR
# ======
# Andreas Hernitscheck  ahernit(AT)cpan.org






# Extracts the path of a filename.
#
#  print get_path('/etc/webserver/httpd.conf');
#  # writes: '/etc/webserver'
#
sub get_path{ # $string ($string)
my $p=shift;

    my @p = splitdir( $p );

    pop @p;
    
    $p = catdir( @p );
        

return $p;
}



# Extracts the whole filename without the path
#
#  print get_file('/etc/webserver/httpd.conf');
#  # writes: 'httpd.conf'
#
sub get_file{ # $string ($string)
my $p=shift;

    my @p = splitdir( $p );

    my $file = pop @p;
    
	

return $file;
}



# Returns the path without a slash on the end.
# You can use it more than once, without doing
# something wrong to the same string.
#
sub remove_trailing_slash{ # $string ($string)
my $p=shift;

    my $sl = SL();

	$p=~ s/\Q$sl\E$//;

    
    
return $p;
}



# Extracts the extension of a filename
#
#  print get_file_extension('/etc/webserver/httpd.conf');
#  # writes: 'conf'
#
sub get_file_extension{ # $string ($string)
my $p=shift;

	$p=get_file($p);
	$p=~ m/\.([^\.]*)$/;
	$p=$1;

return $p;
}




# Extracts the whole filename without the path
#
#  print get_filename('/etc/webserver/httpd.conf');
#  # writes: 'httpd'
#
# Yes, it sounds very similar to get_file(), but I had
# no better idea to describe it without writing get_file_without_extension.
#
sub get_filename{ # $string ($string)
my $p=shift;

	$p=get_file($p);
	$p=~ s/([\.]?[^\.]*)\.(.*)$/$1/;


return $p;
}

1;
#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

String::FilenameStatic - Static functions to manipulate a filename and path.


=head1 SYNOPSIS


 # imports all functions
 use String::FilenameStatic ':all';

 # imports only two functions
 use String::FilenameStatic qw(get_path get_file);
 



=head1 DESCRIPTION

This class provides static functions which can be imported to the namespace of 
the current class.




=head1 REQUIRES

L<Exporter> 


=head1 METHODS

=head2 get_file

 my $string = get_file($string);

Extracts the whole filename without the path

 print get_file('/etc/webserver/httpd.conf');
 # writes: 'httpd.conf'



=head2 get_file_extension

 my $string = get_file_extension($string);

Extracts the extension of a filename

 print get_file_extension('/etc/webserver/httpd.conf');
 # writes: 'conf'



=head2 get_filename

 my $string = get_filename($string);

Extracts the whole filename without the path

 print get_filename('/etc/webserver/httpd.conf');
 # writes: 'httpd'

Yes, it sounds very similar to get_file(), but I had
no better idea to describe it without writing get_file_without_extension.



=head2 get_path

 my $string = get_path($string);

Extracts the path of a filename.

 print get_path('/etc/webserver/httpd.conf');
 # writes: '/etc/webserver'



=head2 remove_trailing_slash

 my $string = remove_trailing_slash($string);

Returns the path without a slash on the end.
You can use it more than once, without doing
something wrong to the same string.




=head1 AUTHOR

Andreas Hernitscheck  ahernit(AT)cpan.org


=head1 LICENSE

You can redistribute it and/or modify it under the conditions of LGPL.



=cut

