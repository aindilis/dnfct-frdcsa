#!/bin/sh

DNFCONTINGENTDIR=/var/lib/myfrdcsa/sandbox/dnf-contingent-20160811/dnf-contingent-20160811

./swi_script.sh $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/domain1.pddl $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/pfile1

./swi_script.sh $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/domain1.pddl $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/pfile3

./swi_script.sh $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/domain1.pddl $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/pfile5

./swi_script.sh $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/domain1.pddl $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/pfile7

./swi_script.sh $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/domain1.pddl $DNFCONTINGENTDIR/DNFct_run/PDDL/elogistics/phuge
