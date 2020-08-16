#!/bin/sh

# a million commits

for Y in {2019..2019}
do
  mkdir $Y
  cd $Y
  for M in {11..12}
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do
      mkdir $D
      cd $D
      range=$((RANDOM % 3))
      for i in `eval echo {1..$range}`
      do
        echo "$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"
      done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push origin master --force
git rm -rf 20**
git commit -am "Run audio engine test"
git push origin master