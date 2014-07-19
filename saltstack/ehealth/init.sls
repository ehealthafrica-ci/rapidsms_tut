---
# Salt State file for: ehealth packages
# Author: vernon on 7/15/14
include:
  - users

www-data:
  group:
    - present
    - gid: 33
  user:
    - present
    - gid: 33
    - uid: 33
    - shell: /usr/sbin/nologin
    - groups:
      - staff
    - require:
      - group: staff
      - group: www-data
...
