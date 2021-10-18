ps -ef | grep jenkins

> we will add Jenkins repo in /etc/yum.repo.d
> add jenkins key jenkins.io.key

java -version

python --version

jenkins job types -

> Freestyle project
> Pipeline
> Multi Configuration project
> Folder
> Multibranch Pipeline

cat /etc/sysconfig/jenkins >> jenkins port

http://3.109.5.205:8080/restart

**user management** security policy
role based authorization - 

- Global roles (console level access)
- item roles > project roles
- node roles > machine level access

tomcat - /opt folder generally

webapps - deployment files r there here
conf -
bin - startup.sh // shutdown.sh

8080 - def port

bin --- ./startup.sh
conf - tomcatusers.xml --> to add the users into it

tomcat file permission issues -- got to webapps - manager - met-inf

=================================================

jenkins workspace --> /var/lib/jenkins

- if we run atleast once a job workspace is created with that name

-- deploy to container plugin

views::

> build pipeline view
> delivery pipeline view

> build monitor view

-----> build with parameters

>> github webhooks

> build periodically and poll scm == both r cron but poll scm triggers when there is a change in scm

::Build triggers::
- build periodically
- gihubhook
- pollscm

-> if u want to copy job = only copy config.xml, if u want everything copy entire folder ++> reload from disk then 
   u can see the changes
   
--> interpolation == we can mask pwds by secret text

--> backup plugin

# pipeline

parallel ==> we can include multiple stages inside

#shared library#

# multibranch pipeline

https://www.jenkins.io/doc/book/pipeline/multibranch/

Multibranch Pipelines expose additional information about the branch being built through the env global variable, such as:

BRANCH_NAME
Name of the branch for which this Pipeline is executing, for example master.

CHANGE_ID
An identifier corresponding to some kind of change request, such as a pull request number


# config.xml ( all the configuration files)

> security = false ( that will not ask pwd )


github webhooks - we send all or push events etc..

- if u want to create 50 jobs with same configuration - we can do it by groovy scipt == mange jenkins - then go to script console

- .jenkins folder / we will have all the folders for each job (config.xml), if u want to copy we can copy from there

- 




























































