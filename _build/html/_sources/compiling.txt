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
won't work on Windows, for example, which does not have a `/home` location. If
you're using Bash on Windows it's better to go with the following alternative.

Alternatively, you can open a terminal and run

..  code::


    wget http://people.cs.vt.edu/~asandu/Software/Kpp/Download/kpp-2.2.3_Nov.2012.zip
    unzip kpp-2.2.3_Nov.2012.zip
    cd kpp-2.2.3

which will automatically download the software, unpack it and move to the
correct directory (which was created when unpacking).
