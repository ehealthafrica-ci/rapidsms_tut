# this system uses structured settings.py as defined in http://www.slideshare.net/jacobian/the-best-and-worst-of-django

try:
    from ..settings import *
except ImportError:
    raise RuntimeError('Error during preset import')

DEBUG = True
TEMPLATE_DEBUG = DEBUG
INTERNAL_IPS = ("127.0.0.1", "192.168.25.207")

#MEDIA_ROOT = '/var/demo-media'
#STATIC_ROOT = "/srv/demo-static"
#STATICFILES_DIRS = (    os.path.join(PROJECT_PARENT, "static"),)
# INSTALLED_APPS.insert(len(INSTALLED_APPS), 'debug_toolbar')

# see: http://docs.djangoproject.com/en/dev/ref/settings/#databases
DATABASES = {

    'default': {
        #'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'phis',
        'USER': 'phis',
        'PASSWORD': 'nopolio4u',
        'PORT': 5432,
        # 'HOST': 'cdc-staging.eocng.org',
        'HOST': 'localhost',
        'OPTIONS': {
            'autocommit': True,
        },
    },

}
