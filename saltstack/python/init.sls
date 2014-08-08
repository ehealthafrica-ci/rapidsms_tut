python-pkgs:
  pkg:
    - installed
    - names:
      - build-essential
      - python-pip
      - python-virtualenv
      - python-dev
      - virtualenvwrapper

/opt:
  file.directory:
    - user: ehealth
    - group: staff
    #- recurse:
    #  - user
    #  - group
    - file_mode: 664
    - dir_mode: 775
    - require:
      - user: ehealth
      - group: staff

/opt/Envs:
  file.directory:  # create a directory for virtual environments
    - user: ehealth
    - group: staff
    - file_mode: 775
    - dir_mode: 775

{% if grains['os'] == 'Ubuntu' %}
/etc/environment:
  file.append:
    - text: 'WORKON_HOME=/opt/Envs'
{% endif %}
