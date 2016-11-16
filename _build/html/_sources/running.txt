Running KPP
===========

Now that KPP is propoerly compiled, we proceed to running the first test case
to make sure it works!

The first test case
-------------------

We now follow the manual and begin running the Chapman stratospheric mechanism
as a test case. This will allow us to illustrate some key features when running
KPP.

In order to run a simulation on KPP, it needs three things:

- a ``.kpp`` file (from the KPP directory, type ``ls examples`` to see some examples of those)
- a ``.spc`` file (type ``ls models`` to see some examples of those)
- a ``.eqn`` file (type ``ls models`` to see some examples of those)

We begin by creating a directory to run this first test. Let's call this
directory ``test1`` and create it with ``mkdir test1``. We go to that directory
with ``cd test1``. Let's follow the manual and create a file called ``small_strato.kpp``
with the following contents:

.. code-block:: fortran

 #MODEL      small_strato
 #LANGUAGE   Fortran90
 #DOUBLE     ON
 #INTEGRATOR rosenbrock
 #DRIVER     general
 #JACOBIAN   SPARSE_LU_ROW
 #HESSIAN    ON
 #STOICMAT   ON

You can do this by typing ``nano small_strato.kpp`` in the ``test1`` directory, if
using Nano, or by using another editor of your choice. Then just paste the
content above in the file, save it and exit it.

This file tells KPP what model to use and how to process it. You can learn more
about this in the KPP manual, but basically our file is telling KPP to use the
``small_strato`` model, output the code in Fortran 90 with double precision
using the Rosenbrock integrator.

If our changes to ``.bashrc`` are correct, then KPP should be able to find the
correct model, since the ``small_strato`` model is located in the ``models``
directory, in the KPP home directory. We test this by running KPP on our
recently created file with ``kpp small_strato.kpp``.

You should see many lines appear onscreen, the last one of them saying ``KPP has succesfully created the model
"small_strato"``, which means you were sucessfull. Now if you type ``ls``,
you'll see many new files:

.. code::

 Makefile_small_strato           small_strato.map
 small_strato_Function.f90       small_strato_mex_Fun.f90
 small_strato_Global.f90         small_strato_mex_Hessian.f90
 small_strato_Hessian.f90        small_strato_mex_Jac_SP.f90
 small_strato_HessianSP.f90      small_strato_Model.f90
 small_strato_Initialize.f90     small_strato_Monitor.f90
 small_strato_Integrator.f90     small_strato_Parameters.f90
 small_strato_Jacobian.f90       small_strato_Precision.f90
 small_strato_JacobianSP.f90     small_strato_Rates.f90
 small_strato.kpp                small_strato_Stoichiom.f90
 small_strato_LinearAlgebra.f90  small_strato_StoichiomSP.f90
 small_strato_Main.f90           small_strato_Util.f90

Most of them end with a ``.f90`` extension, which tells us they are Fortran
codes. These codes have to compiled into an executable file which is what will
actually process and run the kinetic model. So the next step is to compile
every one of those code together into one executable and run it.

Let's focus for now on the ``Makefile_small_strato``. This tells your computer
which Fortran compiler to use to compile, some options and etc. Open the
``Makefile_small_strato`` file and find where it says

.. code-block:: bash

 #COMPILER = G95
 #COMPILER = LAHEY
 COMPILER = INTEL
 #COMPILER = PGF
 #COMPILER = HPUX
 #COMPILER = GFORTRAN

Each of the lines is a different Fortran compiler, and your computer is only
going to see the line that doens't start with a ``#``. So, currently, these
lines are telling the computer to use the intel Fortran compiler, ``ifort``.

If you are using ``ifort``, you should leave it as it is. Since ``ifort`` is
paid, chances are you are using another compiler. If this is the case, put the
``#`` in front of the ``INTEL`` options and take it out of the line which has
the name of your compiler. If you don't know which compiler you have, chances
are you have gfortran, which is free and what we will use here. You can also
install gfortran with ``sudo apt install gfortran``.

So, assuming you're using gfortran, make the lines read

.. code-block:: bash

 #COMPILER = G95
 #COMPILER = LAHEY
 #COMPILER = INTEL
 #COMPILER = PGF
 #COMPILER = HPUX
 COMPILER = GFORTRAN

Save and exit the file.

Now all you have to do is run ``make -fMakefile_small_strato``, which will
compile your fortran code into an executable using the options we just set.
You should see a lot on lines appearing on screen starting with ``gfortran``
and if no error messages appear the compilation was successful.

Now you'll see many more new files, including one called ``small_strato.exe``,
which is your executable file (run ``ls`` again to see that). This is the
executable that will actually calculate the concentrations using the model.

To test if it works, run ``./small_strato.exe``, which will run the executable.
You should see some output on the screen with concentrations, like Fig. :ref:`test1_output`

.. _test1_output:

.. figure:: test1_output.png
   :align: center
   :scale: 90 %
   :alt: Example of output of the first test case.

   Output concentrations of the first test case.



If this is the case, then your run was successfull and everything worked well!
You just calculated the concetrations of the compounds in the ``small_strato``
model with the pre-defined initial conditions.


Understanding and improving on the test case
--------------------------------------------

Now let's understand why our run of ``small_strato.exe`` was successful and what
happened. First, by running the ``.exe`` file we ran a program that got some initial
concentrations of the substances defined for ``small_strato`` and 






