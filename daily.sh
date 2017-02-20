#统计in_app.log_2017-01-12中每个controller访问的次数
cat in_app.log_2017-01-12| awk 'BEGIN{count=0;} {a[$4] ++;count = count + 1; print $4} END{for(i in a) print i,a[i]}'