#!/bin/sh

DNFCTFRDCSADIR=/var/lib/myfrdcsa/codebases/minor/dnfct-frdcsa/systems/dnf-contingent-20160811/DNFct_run
DNFCTPDDLDIR=/var/lib/myfrdcsa/codebases/internal/verber/data/worldmodel/templates/contingent/dnfct

# cd $DNFCTFRDCSADIR && ./swi_script.sh $DNFCTPDDLDIR/prolog_agent/domain1.pddl $DNFCTPDDLDIR/prolog_agent/pfile1_1.pddl
cd $DNFCTFRDCSADIR && ./swi_script.sh $DNFCTPDDLDIR/prolog_agent/domain2.pddl $DNFCTPDDLDIR/prolog_agent/pfile2_1.pddl
