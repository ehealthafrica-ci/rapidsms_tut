---
# Salt Pillar file for: rapidsms_tut settings
# Author: vernon on 8/7/14 
## /srv/pillar/settings.sls
dbengine: django.db.backends.postgresql_psycopg2
dbname: djangodb
dbuser: django
dbpassword: password
dbhost: localhost
dbport: 5432
secret_key: secret_key
...
