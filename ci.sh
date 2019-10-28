#!/bin/bash
# Print helpFunction in case parameters are empty
if [ -z "$START" ] || [ -z "$END" ]
then
   echo "Usage: Define START and END as env variables, also the URL";
   echo "Downloads for ci 1 to 100";
   exit
fi
echo "Output file: ci-$START-$END.csv"
touch ci-$START-$END.csv
BASE_URL=$URL

i=$START
while [ $i -lt $END ]
do
  echo $i
  URL="${BASE_URL}${i}"
  RES=$(curl -s "$URL")
  if grep -q numMesa <<<"$RES"; then
      echo "$i    $RES" >> ./results/ci-$START-$END.csv
  fi
  i=`expr $i + 1`
done
echo "Complete"
