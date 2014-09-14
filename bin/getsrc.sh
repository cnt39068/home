#!/bin/sh
if ([ -z $1 ])
then
  echo "Usage: getsrc.sh <version>"
  echo "Example: getsrc.sh 21.4"
else
  echo $1
#  srcdir=/proj/lteWorkspace/eqtuabe/src/$1
  srcdir=~/src/$1
  echo $srcdir

  cd $srcdir
  rm -rf *.gz

  tar zcf cellLmU.tar.gz $(find /vobs/erbs/node/lm/cellLmU/build/workspace -name *.c -o -name *.hpp -o -name *.cpp -o -name *.h -o -name *.cc -o -name *.asn -o -name *.spec -o -name *.txt)
  tar zcf centralLmU.tar.gz $(find /vobs/erbs/node/lm/centralLmU/build/workspace -name *.c -o -name *.hpp -o -name *.cpp -o -name *.h -o -name *.cc -o -name *.asn -o -name *.spec -o -name *.txt)
  tar zcf elib.tar.gz /vobs/erbs/elib --exclude *.emx --exclude *.html --exclude *.tc --exclude *.efx --exclude *.jpg --exclude *.png --exclude lost+found --exclude *.xml --exclude *.css
  tar zcf up.tar.gz /vobs/erbs/up --exclude *.emx --exclude *.html --exclude *.tc --exclude *.efx --exclude *.jpg --exclude *.png --exclude lost+found --exclude *.xml --exclude *.css
  tar zcf upc.tar.gz /vobs/erbs/upc --exclude *.emx --exclude *.html --exclude *.tc --exclude *.efx --exclude *.jpg --exclude *.png --exclude lost+found --exclude *.xml --exclude *.css
  tar zcf omf.tar.gz /vobs/erbs/omf --exclude *.emx --exclude *.html --exclude *.tc --exclude *.efx --exclude *.jpg --exclude *.png --exclude lost+found --exclude *.xml --exclude *.css
  tar zcf prot.tar.gz $(find /vobs/erbs/node/prot -name *.c -o -name *.hpp -o -name *.h -o -name *.cc -o -name *.asn -o -name *.spec)
  tar zcf prot.tar.gz /vobs/erbs/node/prot --exclude *.emx --exclude *.html --exclude *.tc --exclude *.efx --exclude *.jpg --exclude *.png --exclude lost+found --exclude *.xml --exclude *.css
fi
