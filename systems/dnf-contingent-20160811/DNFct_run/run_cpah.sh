#!/bin/sh
rm theory_*.al

#Sicstus-Prolog
#/usr/bin/time -f "Total time: %e (seconds)" -o result-time ./sic_script.sh $1 $2

#SWI-Prolog
cd /var/lib/myfrdcsa/sandbox/dnf-contingent-20160811/dnf-contingent-20160811/DNFct_run &&  /usr/bin/time -f "Total time: %e (seconds)" -o result-time ./swi_script.sh $1 $2

cat result-time
