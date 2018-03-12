#!/bin/sh

DNFCTFRDCSADIR=/var/lib/myfrdcsa/codebases/minor/dnfct-frdcsa/systems/dnf-contingent-20160811/DNFct_run
DNFCTPDDLDIR=/var/lib/myfrdcsa/codebases/internal/verber/data/worldmodel/templates/contingent/dnfct

cd $DNFCTFRDCSADIR && ./swi_script.sh $DNFCTPDDLDIR/personal_finance/domain1.pddl $DNFCTPDDLDIR/personal_finance/pfile1_1.pddl
# cd $DNFCTFRDCSADIR && ./swi_script.sh $DNFCTPDDLDIR/personal_finance/domain2.pddl $DNFCTPDDLDIR/personal_finance/pfile2_1.pddl
