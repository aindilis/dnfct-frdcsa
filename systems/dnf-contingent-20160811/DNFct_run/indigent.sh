#!/bin/sh

DNFCTFRDCSADIR=/var/lib/myfrdcsa/codebases/minor/dnfct-frdcsa/systems/dnf-contingent-20160811/DNFct_run

cd $DNFCTFRDCSADIR && ./swi_script.sh $DNFCTFRDCSADIR/indigent_logistics/domain1.pddl $DNFCTFRDCSADIR/indigent_logistics/pfile1
