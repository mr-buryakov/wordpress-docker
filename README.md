# Wordpress+mysql+nginx with persistent volumes and logging script
    To deploy WP docker-compose just copy all content in your project working directory and execute: docker-compose -f docker-compose.yml  up --build -d
    ...
    All necessary volumes are persistent including nginx logs utput
    ...
    If you need to scope nginx logs just run script.sh outside the docker container after it was started
    ...
    script.sh explanation:
      #[ -z "$TYPESCRIPT" ] && TYPESCRIPT=1 exec /usr/bin/script -c "TYPESCRIPT=1  $0 $*" 
      redirect all script job placed above these part to current $USER TTY and write it to file named "typesript"
      ...
      #find ./logs/ -mtime +7 -type f | xargs tar -czvf /logs/nginx_archieve_logs_$(date +%F).tar.gz 
      just search files older than 7 days and archeive it with added current date in archeivename
      ...
      #cd logs && grep 500 access.log | wc -l
      go to the directory with nginx logs and grep tall files containing 500 error codes then otput their amount
      ...
    All variables are needed to finally deploy your stack is in docker-compose.yml file.
    _______________________________________________________________________________________________________
    
