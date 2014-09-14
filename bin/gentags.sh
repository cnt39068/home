#!/bin/sh

if ([ -z $1 ] || [ -z $2 ])
then
  echo "Usage: gentags.sh <src> <dest>"
  echo "Example: gentags.sh /home/willc/apue /home/willc/tags"
else
  srcdir=$1
  destdir=$2

  echo $srcdir
  echo $destdir

  cd $destdir

#  rm filenametags
#  rm cscope.files
#  rm cscope.out
#  rm cscope.in.out
#  rm cscope.po.out
#  rm tags
#
#  find $srcdir -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > cscope.files


  # create the cscope file list
  find $srcdir -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.sig" -o -name "lost+found" -prune > cscope.files

  # create the tags
#  ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=lost+found $srcdir
  ctags -L cscope.files

  # create the cscope out files
  cscope -bkq -i cscope.files

  # generate tag file for lookupfile plugin
  echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
#  find $srcdir -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -printf "%f\t%p\t1\n" | sort -f >> filenametags
  find $srcdir -regex '.*\.\(h\|c\|cc\|cpp\|hpp\|sig\)' -type f -printf "%f\t%p\t1\n" | grep -v .metadata | grep -v lost+found | sort -f >> filenametags 
#  find $srcdir -not -regex '.*\.\(png\|gif\|location\|cproject\|classpath\|cdtproject\|markers\|markers.snap\|project\|purify\|pydevproject\|purify_da\|ruleset\|snap\|syncinfo.snap\|dat\|system.lock\|systemRootModFile\|unitConversionData_moam\|vobcopy.log\|what.h\|rb\|efx\|a\|o\)' -type f -printf "%f\t%p\t1\n" | grep -v .metadata | grep -v lost+found | sort -f >> filenametags 
#  find $srcdir -not -regex '.*\.\(png\|gif\|location\|cproject\|classpath\|cdtproject\|markers\|markers.snap\|project\|purify\|pydevproject\|purify_da\|ruleset\|snap\|syncinfo.snap\|dat\|system.lock\|systemRootModFile\|unitConversionData_moam\|vobcopy.log\|what.h\|rb\|efx\|emx\|a\|o\)' -type f -printf "%f\t%p\t1\n" | grep -v lost+found | grep -v .metadata | sort -f >> filenametags
fi

