
Rapidsms_Tut
========================

Below you will find basic setup instructions for this copy of the rapidsms tutorial project.

The original is at http://rapidsms.readthedocs.org/en/latest/tutorial/index.html

Getting Started
---------------

This demo is set up using SaltStack as its deployment engine.

The included script will install and set up django, Postgres, and nginx.

As suggested by Linux standards, statically served pages will be in the /srv directory, 
the operating software will be in /opt, and log files will be in /var/log, all using "rapidsms_tut"
as a subdirectory name.

It is possible to use a Salt minion stand-alone, and these instructions assume that you
will be using that method.  If you already operate a real Salt master server, then
you will merge these files and pillar entries into your existing structures.

If you decide to start using SaltStack today, then these files will be a not-too-bad beginning
for your new Salt master server. You would create the /srv/salt and /srv/pillar directories 
on your new master (otherwise, they will be on your new project's web server).

If you are running from real Salt master, leave the "--local" off of the following commands.

For Salt installation instructions, see:
https://github.com/eHealthAfrica/formhub/wiki/Using-Salt-Stack-for-deployment-and-monitoring.

__NOTE:__ This script sets up "/opt/Envs" as the default location for Python virtual environments.
If you already have a directory for virtual environments, you will want to create a soft link
for /opt/Envs pointing to your existing directory.
`sudo ln -s /home/<your username>/<your venv directory> /opt/Envs`

*If you are configuring a server already connected to the eHealth Africa Salt master ... 
then the next steps are already done. Skip down to "Test your installation", below.*

Copy the contents of the saltstack directory from this repo into a new /srv/salt directory
 on your target computer.

    sudo mkdir /srv/salt
    sudo chown <yourself>:<your group> /srv/salt
    cp -r ./saltstack/* /srv/salt

Make your edits in the new copy. The /srv/salt directory is expected and used by default.

Create a Salt Pillar to hold your private settings. 
  (unless you already have a Salt master,
  (in which case you will add these needed things to your existing pillar.)
Rather than having "settings" values static, we will generate them at the time of deployment with Salt.
Create a directory and "top" file for your pillar:

    sudo mkdir /srv/pillar
    sudo chown <yourself>:<your group> /srv/pillar
        # [ Note: on a live Salt Master, this directory should be _very_ restricted. ]
  
Create a file called top.sls in your new pillar: In order to find your settings file, it should contain:

    ## /srv/pillar/top.sls
    base:
      '*':
        - settings
    # [Note: this is a YAML file. The last two lines are indented by exactly two, and then four spaces.]

Now, create your settings pillar. Put your own values in for the dbname, password and secret key, etc. 
These values will be used when creating the PostgreSql database, and will be inserted in your new
django "settings" environment.

    ## /srv/pillar/settings.sls
    dbengine: django.db.backends.postgresql_psycopg2
    dbname: djangodb
    dbuser: django
    dbpassword: password
    dbhost: localhost
    dbport: 5432
    secret_key: secret_key

Test your installation:  [Remember, omit "--local" if using a salt master]

    sudo salt-call --local state.highstate test=True
    
Run the salt minion to install your software.

    sudo salt-call --local state.highstate

Add yourself to the "staff" group.

    sudo usermod -a -G staff <your username>

Log off your workstation and log back on to get the new group membership and settings...

Then... set your virtual environment to the tutorial

    workon rapidsms_tut

Run syncdb to load your new Postgres database:

    ./manage.py syncdb
    # (be prepared to supply a username and a password for your new django/admin system.)

    ./manage.py migrate

You should now be able to run the development server::

    ./manage.py runserver

The development server will be running on TCP port 8000 on your local computer...
but nginx will be listening for connections from anywhere on TCP port 80,
 and will proxy them to your runserver on port 8000.

Operate your new test server by surfing to `http://<your new server address>` . [Note: no ":8000"]

For the actual operation of the tutorial system, see
http://rapidsms.readthedocs.org/en/latest/tutorial/index.html
