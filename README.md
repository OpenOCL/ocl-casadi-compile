# Deployment programs for OpenOCL

The programs generate the archives to ship OpenOCL including CasADi and Ipopt.
The binaries are shipped together with the source code and the LICENSE files.

A README.txt is created to inform users about use and licenses.


Deployments script requires curl.

```
sh deploy_openocl.sh
```

# Software licenses

## Minimal

* BLAS (through ipopt) http://www.netlib.org/blas
* LAPACK (through ipopt) http://www.netlib.org/lapack
* Metis (through ipopt) http://glaros.dtc.umn.edu/gkhome/metis/metis/overview Metis 2 (from ipopt) needs special license, Metis 3 is Apache License
* MUMPS (through ipopt) http://graal.ens-lyon.fr/MUMPS/
* Ipopt  https://www.coin-or.org/Ipopt/
* Swig Matlab through https://github.com/jaeandersson/swig.git

## Full casadi installation

Software in OpenOCL:

* casadi, LGPL 3

Software included in casadi?   

* ipopt version 3.12, Eclipse Public License - v 1.0, several
* blasfeo GPL 3 with the Classpath Exception
* hpmpc LGPL 3
* qpoases, LGPL 3
* sundials cvodes/idas BSD 3-Clause License
* lapack BSD 3-Clause License modified
* HSL for ipopt/ ma27 
* bonmin Eclipse Public License - v 1.0
* CSparse LGPL 2.1
* OpenBLAS BSD 3-Clause License
* Mumps CeCILL-C
* Metis Apache License, Version 2.0
* sIPOPT (merged with ipopt)
* SWIG GPL 3, multiple, LICENSE-UNIVERSITIES 

Software interfaced but not included in casadi?   

* slicot, GPL 3
* cplex
* gurobi 
* worhp 
* knitro
* snopt

# (Scientific) Attribution

## Casadi
If you use CasADi in your academic work, please cite the following paper:

@Article{Andersson2018,
  Author = {Joel A E Andersson and Joris Gillis and Greg Horn
            and James B Rawlings and Moritz Diehl},
  Title = {{CasADi} -- {A} software framework for nonlinear optimization
           and optimal control},
  Journal = {Mathematical Programming Computation},
  Year = {In Press, 2018},
}

## ipopt
Please Cite Us
We provide this program in the hope that it may be useful to others, and we would very much like to hear about your experience with it. If you found it helpful and are using it within our software, we encourage you to add your feedback to the Success Stories page.

Since a lot of time and effort has gone into Ipopt's development, please cite the following publication if you are using Ipopt for your own research:

A. Wächter and L. T. Biegler, On the Implementation of a Primal-Dual Interior Point Filter Line Search Algorithm for Large-Scale Nonlinear Programming, Mathematical Programming 106(1), pp. 25-57, 2006
(preprint)

As open source software, the source code for Ipopt is provided without charge. You are free to use it, also for commercial purposes. You are also free to modify the source code (with the restriction that you need to make your changes public if you decide to distribute your version in any way, e.g. as an executable); for details see the EPL license. And we are certainly very keen on feedback from users, including contributions!

In order to compile Ipopt, certain third party code is required (such as some linear algebra routines). Those are available under different conditions/licenses.

IPOPT uses a few external packages that are not included in the IPOPT source code distribution, namely ASL (the AMPL Solver Library if you want to compile the IPOPT AMPL solver executable), Blas, Lapack.
Since this third party software is released under different licenses than IPOPT, we cannot distribute their code together with the IPOPT packages and have to ask you to go through the hassle of obtaining it yourself (even though we tried to make it as easy for you as we could). Keep in mind that it is still your responsibility to ensure that your downloading and usage of the third party components conforms with their licenses.

## Blasfeo

the original BLASFEO paper describes the BLASFEO API and the beckend (comprising the panel-major matrix format): 
G. Frison, D. Kouzoupis, T. Sartor, A. Zanelli, M. Diehl, BLASFEO: basic linear algebra subroutines for embedded optimization. ACM Transactions on Mathematical Software (TOMS), 2018. 
(arXiv preprint https://arxiv.org/abs/1704.02457 )

## hpmpc

## Qpoases
If you use qpOASES within your scientific work, we strongly encourage you to cite at least one of the following publications.

@ARTICLE{Ferreau2014,
author = {H.J. Ferreau and C. Kirches and A. Potschka and H.G. Bock and M. Diehl},
title = {{qpOASES}: A parametric active-set algorithm for quadratic programming},
journal = {Mathematical Programming Computation},
year = {2014},
volume = {6},
number = {4},
pages = {327--363},
keywords = {qpOASES, parametric quadratic programming, active set method,
            model predictive control}
}

## Sundials

## Lapack
Like all software, it is copyrighted. It is not trademarked, but we do ask the following:
If you modify the source for these routines we ask that you change the name of the routine and comment the changes made to the original.
We will gladly answer any questions regarding the software. If a modification is done, however, it is the responsibility of the person who modified the routine to provide support.

## HSL for ipopt

A condition of the licence is that HSL is cited in any resulting publications or presentations: 
"HSL. A collection of Fortran codes for large scale scientific computation. http://www.hsl.rl.ac.uk/"

## Bonmin
Description of the underlying algorithms in Bonmin can be found in: P. Bonami, L.T. Biegler, A.R. Conn, G. Cornuejols, I.E. Grossmann, C.D. Laird, J. Lee, A. Lodi, F. Margot, N.Sawaya and A. Waechter, An Algorithmic Framework for Convex Mixed Integer Nonlinear Programs. Discrete Optimization. 5(2):186-204, 2008.
Third Party required code

Bonmin needs a few external packages which are not included in the Bonmin package. The reason why they are not included in the package is that they have licenses which are incompatible with the CPL under which Bonmin is distributed. You should pay attention to the particular licenses of each of them before downloading them.
Lapack (Linear Algebra PACKage)
Blas (Basic Linear Algebra Subroutines)
A sparse linear solver. Either 1.HSL (Harwell Subroutine Library)
the sparse linear solver MA27, or MA57
optionally (but strongly recommended) MC19 to enable automatic scaling in Ipopt.
or MUMPS

## Csparse

CSPARSE: a Concise Sparse matrix package.
Copyright (c) 2006, Timothy A. Davis.
http://www.cise.ufl.edu/research/sparse/CSparse

## OpenBLAS

## Mumps:
[1] P. R. Amestoy, I. S. Duff, J. Koster and J.-Y. L'Excellent, A fully asynchronous multifrontal solver using distributed dynamic scheduling, SIAM Journal of Matrix Analysis and Applications, Vol 23, No 1, pp 15-41 (2001).
[2] P. R. Amestoy, A. Guermouche, J.-Y. L'Excellent and S. Pralet, Hybrid scheduling for the parallel solution of linear systems. Parallel Computing Vol 32 (2), pp 136-156 (2006).

## Metis

How to cite METIS?
“A Fast and Highly Quality Multilevel Scheme for Partitioning Irregular Graphs”. George Karypis and Vipin Kumar. SIAM Journal on Scientific Computing, Vol. 20, No. 1, pp. 359—392, 1999.

## SWIG

SWIG Copyright and Authors
Copyright (c) 1995-2011 The SWIG Developers
Copyright (c) 2005-2006 Arizona Board of Regents (University of Arizona).
Copyright (c) 1998-2005 University of Chicago.
Copyright (c) 1995-1998 The University of Utah and the Regents of the University of California

IMPORTANT: The following represents the intent of the SWIG developers with regard to how SWIG is licensed to the public. This is not legal advice; if there are any specific questions about how SWIG's license applies to your use, please seek legal counsel.

The intention of the SWIG license is to ensure that the SWIG source code (the code that is compiled into the SWIG executable) remains free software by using the GPL license on the SWIG source code. SWIG is a code generator and the intention of the SWIG license is also to enable distribution of the output code under license terms of the user's choice/requirements.

The full license is available in the following files:

LICENSE
LICENSE-GPL
LICENSE-UNIVERSITIES
COPYRIGHT
When SWIG is used as it is distributed by the SWIG developers, its output is not governed by SWIG's license (including the GPL). SWIG's output contains code from three sources:

code generated by SWIG, which is not governed by copyright;
code copied from the SWIG library which is permissively licensed to be redistributed without restriction;
code derived from the user's input, which may be governed by the license of the code supplied by the user.
So, while the input supplied to SWIG may affect the license of SWIG's output (e.g. if the input code is licensed under a copyleft or proprietary license), SWIG's license does not affect the license of the output. This is consistent with the FSF's FAQ entries on this subject (GPLOutput and WhatCaseIsOutputGPL), because the SWIG code copied into the output by SWIG is not GPL-licensed.

