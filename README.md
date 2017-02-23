# ReadTheDocs (RTD) Docker 

 [![](https://images.microbadger.com/badges/version/qqbuby/readthedocs:uwsgi.svg)](https://microbadger.com/images/qqbuby/readthedocs:uwsgi "Get your own version badge on microbadger.com")
     
 The docker image that uses to set up the RTD with uWSGI, and responds to the `qqbuby/readthedocs-uwsgi`.

 For more information about ***uWSGI***, please refer to [The uWSGI project](https://uwsgi-docs.readthedocs.io/en/latest/).

 For more information about how to set up Django so that it works nicely with uWSGI and nginx, pleae refer to [Setting up Django and your web server with uWSGI and nginx](http://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html). 
 
 - `EXPOSE 9527`
 - `CMD ["uwsgi", "--ini", "readthedocs.ini:dev"]`
 - *readthedocs.ini*
 
     ```uwsgi
     [uwsgi]
     ini = :dev
     
     [dev]
     env = DJANGO_SETTINGS_MODULE=readthedocs.settings.dev
     ini = :readthedocs
     
     [readthedocs]
     chdir = /var/readthedocs
     wsgi-file = readthedocs/wsgi.py
     
     http = 0.0.0.0:8000
     socket = 0.0.0.0:9527
     
     master = true
     workers = 4
     enable-threads = true
     
     vaccum = true
     ```
