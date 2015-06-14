

Example usage
=============

Let's get started.

	$ todo.pl
	$

OK. So it looks my day is free. Time to fill it up

	$ todo.pl Write a TODO list script
	1. Write a TODO list script
	$

I'll just check that it worked.

	$ todo.pl
	1. Write a TODO list script
	$

Well, there's some other stuff involved in that...

	$ todo.pl Learn Perl
	1. Write a TODO list script
	2. Learn Perl
	$ todo.pl Profit!
	1. Write a TODO list script
	2. Learn Perl
	3. Profit!
	$

So let's see what I've ended up with:

	$ todo.pl
	1. Write a TODO list script
	2. Learn Perl
	3. Profit!
	$

I wonder where all this is kept?

	$ ls
    todo.txt  todo.txt.~
	$ cat todo.txt
	Write a TODO list script
	Learn Perl
	Profit!
	$

Interesting! Anyway, I guess I've done enough to cross off learning Perl (for now anyway!)

	$ todo.pl
	1. Write a TODO list script
	2. Learn Perl
	3. Profit!
	$ todo.pl 2
	1. Write a TODO list script
	2. Profit!
	$ 

And it looks like I have my TODO list script now

	$ todo.pl
	1. Write a TODO list script
	2. Profit!
	$ todo.pl 1
    1. Profit!
    $ 

Wait! I haven't finished writing the documentation, so I'm not *really* done! When I checked before, it looked like
there was some sort of back up. Fingers crossed that's what it was!

	$ ls
    todo.txt  todo.txt.~
	$ cat todo.txt.~
	Write a TODO list script
    Profit!
    $

Phew! Let's do a quick restore

	$ rm todo.txt
	$ mv todo.txt.~ todo.txt
	$ todo.pl
    1. Write a TODO list script
    2. Profit!

OK. Back to work!



