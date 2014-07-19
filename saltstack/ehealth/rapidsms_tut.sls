---
# Salt State file for: installing demo package: rapidsms_tut
# Author: vernon on 7/15/14 
include:
  - ehealth
  - utility
  - python
  - users
  # - postgresql

repo:
  git.latest:
    - name: https://github.com/eHealthAfrica/rapidsms_tut.git
    - rev: master
    - always_fetch: True
    - target: /opt/rapidsms_tut
    - user: ehealth
    - require:
      - pkg: git
  file.directory:
    - name: /opt/rapidsms_tut
    - user: ehealth
    - group: staff
    - dir_mode: 775
    - recurse:
      - user
      - group

/opt/Envs/rapidsms_tut:
  file.directory:
    - user: ehealth
    - group: staff
    - dir_mode: 775
    - require:
      - user: ehealth
  virtualenv.managed:
    - system_site_packages: True
    - requirements: /opt/rapidsms_tut/requirements.txt
    - require:
      - pkg: python-virtualenv
      - pkg: python-pip
      - pkg: psycopg2

psycopg2:
  pkg:
    - name: python-psycopg2
    - installed

/opt/rapidsms_tut/rapidsms_tut/salt_settings.py:
  file.managed:
    - source: salt://ehealth/rapidsms_tut.settings.py
    - template: jinja
    - require:
      - file: repo

/opt/rapidsms_tut/manage.py:
  file.managed:
    - mode: 775
    - source: salt://ehealth/manage.py
    - template: jinja
    - require:
      - file: repo

/opt/Envs/rapidsms_tut/.project:
  file.managed:
    - contents: "/opt/rapidsms_tut\n"
    - require:
      - file: /opt/Envs/rapidsms_tut

/var/log/rapidsms_tut:
  file.directory:
  - user: www-data
  - group: staff
  - file_mode: 660
  - dir_mode: 770
  - require:
    - user: ehealth

...
