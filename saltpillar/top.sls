---
# Salt Pillar file for: rapidsms_tut (sample)
# obviously, this file will be much larger on a production SaltStack deployment -- this one is the simplest possible.
# Author: vernon on 8/7/14 
## /srv/pillar/top.sls
base:
  '*':  # for any minion
    - settings
  'local'
    - tut_settings  # refer to the file "tut_settings.sls"
# [Note: this is a YAML file. The last two lines are indented by exactly two, and then four spaces.]
...
