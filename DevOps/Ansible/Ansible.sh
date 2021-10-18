var

- in a playbook
- in a inventory(deprecated)
- in inclusion file

-hosts:all
  vars:


-hosts:all
 vars_files:
   - vars/user.yml



{{ var_name }}


variable precedence : 

global scope - inventory or commandline

play scope - play

host scope - inclusion file

>> if its in comand line - 1st precedence

built in variable == ansible_version


> var can be applied for hosts and group of hosts


>>> group_vars / host_vars === folder name

group_vars == when we want to use variables to multiple groups in inventory

[tomcat]
32172.78.97.8
[tomcat-server:children]
tomcat

host_vars == seperate for each host , the file inside host_vars should be name with hostname or ip 

> multi values var == arrys or dict


## secrets

ansible vault --

> encrypt and decrypt files

ansible-vault

ansible-vault create playbook.yml

##facts

- variables

gathering facts

## loop

before loop - prev versions we used with_items


ssh-keygen -t rsa

- copy the key to slave folder /root/.ssh/authorizedkeys

- ansible inventory
- ansible-inventory --graph
- all and ungrouped


ansible-doc -l  --> list all the modules

ansible <ungrouped> -a "uname -a"

ansible <ungrouped> -m user -a "name=arjun"

ansible ungrouped -m command -a "id arjun"

ansible lamp -m shell -a "grep /etc/passwd"	


ansible all -m ping

ansible all -m file -a 'path=/var/www/html/index.html state=absent'


modules:

- service
- shell
- raw
- user
- copy

playbook:


ansible-playbook 

- gathering facts is default task for ansible

ansible-playbook --syntax-check <playbook>

ansible-playbook -v <playbook> gives o/p
                 -vv -- op/inp
				 -vvv -- conn. info

ansible-playbook -c == dry run


- yum
- copy
- service
- dubug
- shell
- register
- package
- syncronize module > to reverse copy
- fetch > to reverse copy
- file

Ansible package module autodetect your OS default package manager (e.g yum, apt) from existing facts.

>>> group_var
>>> host_var


variables and facts:


config file - [default]

ansible-playbook groupvar.yml -e "web_package=hproxy"

ansible-playbook groupvar.yml -e "web_package=hproxy" -e "web_serve=sshd"

ansible-vault 

ansible-vault create <playbook.yml>

ansible-vault view

ansible-vault edit


ansible-vault decrypt/encrypt <file.yaml>

ansible-vault rekey

ansible-playbook --ask-vault-pass vault.yml

ansible-playbook --vault-password-file=play.pass vault.yml


ansible-vault rekey vault.yml


# facts

ansible lamp -m setup


# register

to store ouput of command

# when

statements for condition

> to check a var is true or false

> when multiple conditions

## Handlers

> restart service and reboot hosts

> all tasks should run then only handler runs (force_handlers: true)

> one task may trigger multiple handlers (rare case)

>> we will have 'notify' 

>> if a task is modified and run, then only handler again runs 

## block

> superset of tasks
> error handling supports
  - rescue
> we cant use items(loops)

> rescue block - except, always block

> 

## jinja templates

file modification modules

- lineinfile = if we want to change single lines
- blockinfile = if we want change multi lines
- copy
- fetch = copy from slave to master
- file


jinja templates

- advanced modifications to files
- we have elements like data,vars, expressions , control structres
- target file in managed host variables will render
- it uses var section

## ansible - role

- we need to organize ansible dir.
- re-usability
- site.yml == master playbook

roles::

defaults - var in this can be over ridden
files
handlers - /main.yml
meta - /main.yml
tasks- /main.yml
templates - 
tests(optional)
vars - /main.yml (u cant over ride with var in play)

precedence of roles ->

./roles == highest precedence
~/.ansible/roles == next
/etc/ansible/roles == next
/etc/share/ansible/role == next

> ansible-galaxy search 

- search by author , tags , env

ansible-galaxy search wordpress --platform EL
ansible-galaxy info bertvv.wordpress


ansible-galaxy install bertvv.wordpress

ansible-galaxy list

ansible-galaxy remove <name>

ansible-galaxy init myrole

>> download multiple from ansible-galaxy

ansible-galaxy install -r roles/ansiblegalaxy_multiple.yml -p . (install in current dir)

##

playbook first role runs then ...task then handlers...

we want to run task before roles
- pre_tasks
- post_tasks

## real time

ansible-inventory --list

> it will be in json file but we can write in python

> we cant create dependency inventory


host pattern -
> - hosts: *.ttt.com
 : 192.168.*
 
> parallelisim 
  - fork value = defult value = 5
  
> "serial" keyword ==> that will run serially (rolling updates)

> we wont have def logging

> we cant use /var/log

> we need to include in ansible.cfg
    - log_path = tt11.log
  [defaults]
log_path = ./ansible.log

> debug module == verbosity (v and vv and vvv)

> check mode: 
    - it will not run just diplays o/p
	
>> ansible-playbook --check

> check_mode: yes ( it will run the task in check mode)

modules:

- uri
- script
- stat ( atime, isdir, exec, size)
- assert


connection issues trouble shooting:

- remote_user
- host key setup
- become & become_user
- visudo


## ansible tags

tags:
  - <somenametotag>
  
ansible-playbook lamp apche.yml --tags=install

ansible-playbook lamp apche.yml --tags=install,start

ansible-playbook lamp apche.yml --skip-tags=install ==> it skips the tag and runs all


ansible - playbook

get_url:
	url: 
	dest: 
	
	
multiple plays --> we can run certain tasks on one host and other

- we can use windows as managed node

ansible tower - role based auth, easy deployment , can be easily configured inventory

Ansible plugins - connection plugin (SSH)

