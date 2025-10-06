#!bin/bash
for $@ in {mysql,nginx};
do
    echo "$@"
done