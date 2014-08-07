---
# Salt Pillar file for: rapidsms_tut settings
# Author: vernon on 8/7/14 
## /srv/pillar/tut_settings.sls

# data for rapidsms_tut staging server
dbengine: django.db.backends.postgresql_psycopg2
dbname: djangodb
dbuser: django
dbpassword: password
dbhost: localhost
dbport: 5432

secret_key: secret_key

django_settings_module: rapidsms_tut.salt_settings

...
