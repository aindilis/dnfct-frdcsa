#!/bin/sh

DNFCTFRDCSADIR=/var/lib/myfrdcsa/codebases/minor/dnfct-frdcsa/systems/dnf-contingent-20160811/DNFct_run
DNFCTPDDLDIR=/var/lib/myfrdcsa/codebases/internal/verber/data/worldmodel/templates/contingent/dnfct

cd $DNFCTFRDCSADIR && \
    ./swi_script.sh \
	$DNFCTPDDLDIR/indigent_logistics/current/indigent_logistics.d.verb \
	$DNFCTPDDLDIR/indigent_logistics/current/indigent_logistics.p.verb

# cd $DNFCTFRDCSADIR && \
#     ./swi_script.sh \
# 	$DNFCTPDDLDIR/indigent_logistics/current/indigent_logistics.d.pddl \
# 	$DNFCTPDDLDIR/indigent_logistics/current/indigent_logistics.p.pddl
