# see https://qiita.com/samunohito/items/d167aed2552620e4dfae
export DISPLAY=`ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'`:0
