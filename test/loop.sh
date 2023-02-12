while read p; do
  echo "$p"
  getallurls "$p"
done <uniq
