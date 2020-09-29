#!/bin/bash 
  
NAME="tidyquant_ai_app"                                 # Name of the application 
DJANGODIR=/home/anshu/tidyquant_sample/tidyquant_ai            # Django project directory 
SOCKFILE=localhost:8000 # we will communicte using this unix socket 
USER=anshu                                       # the user to run as 
GROUP=anshu                                    # the group to run as 
NUM_WORKERS=3                                    # how many worker processes should Gunicorn spawn 
DJANGO_SETTINGS_MODULE=tidyquant_ai.settings            # which settings file should Django use 
DJANGO_WSGI_MODULE=tidyquant_ai.wsgi                    # WSGI module name 
  
echo "Starting $NAME as `whoami`" 
  
# Activate the virtual environment 
cd $DJANGODIR 
Source ../venv/bin/activate 
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE 
export PYTHONPATH=$DJANGODIR:$PYTHONPATH 
  
# # Create the run directory if it doesn't exist 
# RUNDIR=$(dirname $SOCKFILE) 
# test -d $RUNDIR || mkdir -p $RUNDIR 
  
# Start your Django Unicorn 
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon) 
exec /home/anshu/tidyquant_sample/myenv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \ 
 --name $NAME \ 
 --workers $NUM_WORKERS \ 
 --user=$USER --group=$GROUP \ 
 --bind=$SOCKFILE \ 
 --log-level=debug \ 
 --log-file=-