nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - file: new-default

default-nginx-out:    # remove the stock default file and replace with ours:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

new-default:
  file.managed:
    - name: /etc/nginx/sites-available/eha-default
    - source: salt://nginx/eha-default.conf

enable_eha_default:
  cmd:
    - run
    - name: ln -s /etc/nginx/sites-available/eha-default /etc/nginx/sites-enabled/eha-default
    - unless: test -L /etc/nginx/sites-enabled/eha-default
    - require:
      - file: /etc/nginx/sites-available/eha-default
