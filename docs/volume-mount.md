We will now mount the volume which is attached to the ec2 instance. The device name will differ depending on the type of the instance you choose. We have `nvme1n1` and `xvdh` types configured here.

### Bastion Playbook
Now, let's add the volume-mount role to the playbook which will look like below.

```yaml
- name: dev bastion
  hosts: tag_project_dev_bastion
  remote_user: ubuntu
  become: true
  roles:
    - { role: base,           tags: [ 'base'       ] }
    - { role: monit,          tags: [ 'monit'      ] }
    - { role: mount-drive,    tags: [ 'mount-drive'] }
```

### Execution
To execute the playbook, run the below command.

```sh
$ ansible-playbook dev-bastion.yml --tags=mount-drive
```

!!! warning
    Check the output and verify there are no errors that is interrupting the playbook from executing all the tasks. Fix all the errors when found.