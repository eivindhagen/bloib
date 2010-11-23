#!/usr/bin/perl -w

use strict;
use FCGI;
use CGI;
use Getopt::Long qw/:config gnu_getopt no_ignore_case auto_abbrev/;

sub usage {
       print STDERR "$0 --fcgi-socket=(path|[host]:port) ",
                    "--cgi-bin=path\n";
       exit 1;
}

my ($fcgi_sock, $cgi_bin);
GetOptions('fcgi-socket|s=s' => \$fcgi_sock,
           'cgi-bin|c=s' => \$cgi_bin) or usage();

usage() unless ($fcgi_sock && $cgi_bin);

die "FastCGI socket: $fcgi_sock already exists!\n" if (-S $fcgi_sock);
die "CGI executable: $cgi_bin does not exist!\n" if (!-f $cgi_bin);

# gitweb will exit, make it throw an exception instead:
no warnings qw/once/;
*CORE::GLOBAL::exit = sub { die 'gitweb_exit' };
use warnings;

# FCGI will erase the current %ENV; so make sure we save this:
my $gwcfg = $ENV{GITWEB_CONFIG};

my $fcgi_req = FCGI::Request(\*STDIN, \*STDOUT, \*STDERR, \%ENV,
                             FCGI::OpenSocket($fcgi_sock, 128),
                             FCGI::FAIL_ACCEPT_ON_INTR);
while ($fcgi_req->Accept >= 0) {
       unless ($ENV{PATH_INFO}) {
               # nginx currently fails to set PATH_INFO,
               # so we'll do it ourselves
               my $pi = $ENV{SCRIPT_NAME};
               $pi =~ s!^/\+!!;
               $ENV{PATH_INFO} = $pi;
       }
       # clear CGI query parameters set inside gitweb so we can reparse
       # the %ENV fed to us
       CGI::initialize_globals();
       $ENV{GITWEB_CONFIG} = $gwcfg if defined $gwcfg;
       do $cgi_bin;
       delete $ENV{PATH_INFO};
}

END {
       unlink $fcgi_sock if (defined $fcgi_sock && -S $fcgi_sock);
}
