Compiling KPP
=============

In this chapter we detail how to successfully download and compile KPP
on your system under the Bash environment.

Downloading into your folder
----------------------------

One of the first things to be said is: most of the commands we will use will
only work if you're in the right directory (which we will always tell what it
is). So when you open a terminal, that terminal is "running" in some directory
in your computer.  You can find out which directory that is by entering the
command `pwd` which stands for "Print Working Directory". That will show you
exactly where you are on your computer. You can also enter `ls`, which will
"list" everything you have on that directory. To change directories, you can
use the command `cd`, which stands for "Change Directory". So if you want to go
to your downloads directory, you can type `cd Downloads`, or `cd
/home/user/Downloads` depending on where you are on your terminal (the first is
a relative and the second is an `absolute or full path
<https://jeremywsherman.com/blog/2011/09/26/absolute-and-relative-paths/>`_).

If you prefer to download KPP through its website manually and unpack it
somewhere, you'll have to go there with your terminal. So, if I unpack it in my
home directory, as soon as I open my terminal I'll have to use `cd
/home/myname/kpp-2.2.3`. This command will only work if the path is correct (it
might not work on Windows, for example, which does not have a `/home` location.
If you're using Bash on Windows it's better to go with the following
alternative.

Alternatively, you can open a terminal and run

..  code-block:: bash

 wget http://people.cs.vt.edu/~asandu/Software/Kpp/Download/kpp-2.2.3_Nov.2012.zip
 unzip kpp-2.2.3_Nov.2012.zip
 cd kpp-2.2.3

which will automatically download the software, unpack it and move to the
correct directory (which was created when unpacking).

Make sure you're in the correct directory by entering ``pwd``, which should show
you that you're on the `kpp-2.2.3` directory. You can also type `ls`, which should
show you a list of everything that was in the zip file::

 cflags        drv       int                 Makefile.defs  site-lisp
 cflags.guess  examples  int.modified_WCOPY  models         src
 doc           gpl       Makefile            readme         util


Making sure dependecies are installed
-------------------------------------

Now we are going to set-up the environment to compile KPP. The first step is to
make sure that you have the necessary software.

Be sure that FLEX (public domain lexical analizer) is installed on your
machine. You can run ``flex --version`` and if it is installed you should see
something like ``flex 2.6.0``. If instead you see something like ``flex:
command not found`` then it means that it is not installed and you're going to
have to install it by running ``sudo apt update && sudo apt install flex`` if
you're running Linux natively or by manually installing downloading and
installing the file if you're emulating (with Cygwin, for example).

Be also sure that ``yacc`` and ``sed`` are installed by typing ``which yacc``
and ``which sed``. If you see something like ``/usr/bin/sed`` or
``/usr/lib/yacc`` then they are installed. If you see an error message, then
you're going to have to install it.

Telling your system where KPP is
--------------------------------

Now that Flex is installed, we need to make sure that the system knows where KPP
is in your system. We do that by altering a file called ``.bashrc``, which
sets some configurations for your terminal (if you're using a Bash terminal).
This is a text file and we simply need to add some lines. We'll do that step by step.

First, in the directory where you unpacked KPP, run the command ``pwd`` to
print the present working directory and copy its output. You'll need this to
tell your terminal where KPP is.

Now you need to open and edit ``.bashrc`` which can be done with many programs.
The best option would be to try ``gedit``, ``geany``, ``pluma`` or ``abiword``,
which all have graphical user interfaces (GUI). You can try all of these in the
command ``gedit ~/.bashrc``, or ``geany ~/.bashrc`` and so forth with the
others. If any of those work, great! If not, you're probably going to have to
use Nano by running the command ``nano ~/.bashrc``, which runs on the terminal
itself.

With Nano, you're going to see something like Fig. `ref::something`_ after you
open it. If you're using something else you'll probably see something more
friendly, but with the same lines of code. You can ignore all those codes and
jump to the last line of the file.  You're going to create another line and
paste

.. code-block:: bash

 export KPP_HOME=$HOME/kpp
 export PATH=$PATH:$KPP_HOME/bin

except that you should replace ``$HOME/kpp`` with the output of your ``pwd`` command.
For example, if the output of ``pwd`` was ``/home/user/Downloads/kpp-2.2.3`` you
should write

.. code-block:: bash

 export KPP_HOME=/home/user/Downloads/kpp-2.2.3
 export PATH=$PATH:$KPP_HOME/bin

After this is done, you are going to save and exit. If you're using any option
with a GUI this should be straightforward. With Nano you can do it by pressing
control X, choosing the "yes" option (by only pressing y) when it asks you to
save, and then pressing enter when asked to confirm to name of the file to save
to.

Now your terminal will know where KPP is the next times you start it. But for
the changes to make effect you need to close this terminal and open another
one. So just close the terminal you were working with, open a new one. Now, if
everything worked properly, you should be able to type ``cd $KPP_HOME`` and go
automatically to your KPP directory.

Specifying how to compile
-------------------------

If this worked, we are ready for the next step, which is telling your system
how to compile KPP. First, type ``locate libfl.a`` and save the output. If that
is no output, use ``locate libfl.sh`` and save the output of that. In my case
the output was ``/usr/lib/x86_64-linux-gnu/libfl.a``. If neither of those
commands gave you an output, you might need to install the Flex-dev package
with ``sudo apt install flex-devel.x86_64``.

Now in your KPP directory, use the same text editor as before to open a file
called ``Makefile.defs``, which sets how Bash is going to make the executable
code for KPP. So type ``gedit Makefile.defs``, or ``nano Makefile.defs`` and so
on, depending on the editor you're using.

Once again, you'll see a lot of lines with comments, and the only lines that
matter are those that don't start with ``#``. Look for the 5 items to complete
in this file. The first one is ``CC``, which sets the compiler. In this guide
we will use the Gnu Compiler Collection, ``gcc``. So make sure that the line
which starts with ``CC`` reads ``CC=gcc``.

Next, since we made sure that Flex was installed, make sure the next important
line reads ``FLEX=flex``. On the third step, set the next variable
(``FLEX_LIB_DIR``) with the output we just saved without the last part. So in
my case the output saved was ``/usr/lib/x86_64-linux-gnu/libfl.a``, so the line
will read ``FLEX_LIB_DIR=/usr/lib/x86_64-linux-gnu``. You should, of course,
replace your line accordingly.

The next two items defines the options of the compiler and extra directory
to include in the compilation. We will not worry about those, which unless
maybe when debugging. Now you can save and close/exit the file.

If we did everything correctly we can compile KPP simply by running the
``make`` command. Many warnings are going to appear on the screen, but as long
as no error appears, the compilation will be successful. You can be sure it
was successsful by once again running ``ls`` and seeing that there is now one
extra file on the KPP directory called ``bin``:

.. code-block:: bash

 bin           doc       gpl                 Makefile       readme     util
 cflags        drv       int                 Makefile.defs  site-lisp
 cflags.guess  examples  int.modified_WCOPY  models         src


Now let's test it by running ``kpp test``. If the output is something like

.. code::

 This is KPP-2.2.3.

 KPP is parsing the equation file.
 Fatal error : test: File not found
 Program aborted

then we know it worked. This tells you the version of KPP and that it couldn't
file any file to work with, which is fine because we didn't give it any yet. If
this worked, you can skip to the next section.


If, however you get an output similar to ``kpp: command not found...`` then
chances are that ``bin`` is a binary executable file, while it should be a
directory containing the binary file. This should not happen, according to the
manual, but for some reason it (very) often does. We need simply to rename that
executable file and put it a directory called ``bin``. This can be done with
the followinf command:

.. code-block:: bash

 mv bin kpp && mkdir bin && mv kpp bin

Try this command and then try ``kpp test`` again. You should get the correct
output this time, meaning that the system could find KPP successfully.

