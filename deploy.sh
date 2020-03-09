# http://stephenmann.io/post/hosting-a-hugo-site-in-a-google-bucket/
# build site
hugo -t hugo_theme_pickles --baseUrl=/
# upload to bucket
# scp -r ../songq.in root@songq.in:~/
rsync -rzv . root@songq.in:~/songq.in


# ssh -t root@songq.in "cd songq.in && hugo server -t hugo_theme_pickles -w -D -p 1234 --baseUrl=https://songq.in --appendPort=false"
# ssh -t root@songq.in "cd songq.in/public && screen -d -m python -m SimpleHTTPServer 1234 ."

echo 'Deployed!'
