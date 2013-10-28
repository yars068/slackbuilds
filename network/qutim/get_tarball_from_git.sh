#!/usr/bin/bash

# Create a snapshot from the git repository

TMP=${TMP:-/tmp}

rm -fR $TMP/tmp-qutim
mkdir -p $TMP/tmp-qutim
cd $TMP/tmp-qutim

echo "fetching stuff from git..."
git clone --recursive git://github.com/euroelessar/qutim.git

cd qutim
COMMIT=$( git log -1 | head -1 | cut -c 8-14 )
COMMIT_DATE=$( git log -1 --date=short | grep ^Date | awk '{print $2}' | sed 's/-//g' )
git archive --prefix=qutim-${COMMIT_DATE}_${COMMIT}/ master > ../temp.tar

j=0
for i in artwork core/3rdparty/k8json core/3rdparty/q-xdg plugins/docktile/qtdocktile protocols/jabber/jreen protocols/vkontakte/vreen qbs translations; do
  ( cd $i
    git archive master > $TMP/tmp-qutim/$j.tar )
  let j++
done

cd ..
tar xf temp.tar
cd qutim-${COMMIT_DATE}_${COMMIT}

j=0
for i in artwork core/3rdparty/k8json core/3rdparty/q-xdg plugins/docktile/qtdocktile protocols/jabber/jreen protocols/vkontakte/vreen qbs translations; do
  ( cd $i
    tar xf $TMP/tmp-qutim/$j.tar )
  let j++
done

cd ..

echo "creating tarball..."
tar Jcf $TMP/qutim-${COMMIT_DATE}_${COMMIT}.tar.xz qutim-${COMMIT_DATE}_${COMMIT}

echo "qutim tarball $TMP/qutim-${COMMIT_DATE}_${COMMIT}.tar.xz created."
