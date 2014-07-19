## /srv/salt/top.sls
---
# a truncated copy of the actual top.sls used at the moment this script worked.
base:
  '*':
    - users
    - python

  vern-test:
    - nginx
    - postgres
    - ehealth.rapidsms_tut
