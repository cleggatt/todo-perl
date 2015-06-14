#!/usr/bin/perl

use strict;
use warnings;

use File::Copy qw(copy);
use Scalar::Util qw(looks_like_number);

my @todos;

sub Load() {
    my $filename = 'todo.txt';

    if (-e $filename) {
        open(my $fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename' $!";

        while (<$fh>) {
            chomp;
            push @todos, $_;
        }
        close $fh;
    }
}

sub Backup {
    copy "todo.txt", "todo.txt.~";
}

sub Store {
    open my $fh, '>', "todo.txt" or die "Cannot open todo.txt: $!";

    foreach (@todos) {
        print $fh "$_\n";
    }
    close $fh;
}

sub List {
    for my $i (1 .. @todos) {
	    print "$i. $todos[$i-1]\n";
    }
}

sub Add {
    push @todos, $_[0];
}

sub Remove {
    splice @todos, ($_[0] - 1), 1;
}

sub CmdList {
    Load();
    List();
}

sub CmdAdd {
    Load();
    Add($_[0]);
    Store();
    List();
}

sub CmdDel {

    Load();

    my $index = $_[0];
    if ($index < 0 or $index > (scalar @todos)) {
        print "Index out of bounds\n";
        List();
    } else {
        Backup();
	Remove($index);
	Store();
	List();
    }
}

my $num_args = @ARGV;

if ($num_args == 0) {
    CmdList();
} elsif ($num_args == 1) {

    my $param = $ARGV[0];

    if (looks_like_number($param)) {
      CmdDel($param)
    } else {
       CmdAdd($param);
    }
} else {
    CmdAdd(join(' ', @ARGV));
}
