.. _bugs:

Possible bug fixes
==================

.. note::

 This section is meant to become a list of common bugs that might arise
 along with a way to solve them. 

Can't fine bashrc file
----------------------
If you could not find your ``.bashrc`` file, it might mean that you either
don't have one, or that it is located somewhere else. If you're using C shell,
then you should be actually looking for ``.cshrc``. If that is indeed the case,
replace ``bashrc`` by ``cshrc`` everywhere it appears. Furthermore, environment
definitions are made slightly different in C shells. Instead of typing ``export
KPP_HOME=$HOME/kpp`` for example, you would have to type ``setenv KPP_HOME
$HOME/kpp``. For other (less common) shells, we advice you to google these
definitions. They should be easy to find.  When in doubt of which shell you're
using, type ``echo $SHELL`` and check the output.

If you still can't find your ``.bashrc`` or ``.cshrc``, chances are you're using
an emulator, and not running natively. If this is the case, google for the
location of the ``.bashrc``-equivalent in your shell emulator (be it, Cygwin,
Mingw, cmder or others).


