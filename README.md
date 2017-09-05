# Bitbucket by Ansible

## Purpose

Provide a zero-touch ansible deployment to stand up bitbucket, elasticsearch and postgres in docker containers with preconfigured settings.

## Warning

The scripts are purely for experimental purpose and does not follow any best practices at this stage.


## Setup

### Target Host Prerequistes

The following has not been automated (yet) so will have to be preconfigured:

#### 2. Install docker

#### 3. Install pip 

```
$ sudo yum install python-setuptools
$ sudo easy_install install pip
$ sudo yum install python-devel
```


#### 4. Build Images

Use the Dockerfiles provides in the repo.

```
$ cd docker/elasticsearch
docker build -t hniyaz/elasticsearch:1.0 .
```

```
$ cd docker/postgres
docker build -t hniyaz/postgres:1.0 .
```


## Ansible Prerequistes

### Secrets

Bitbucket secrets are stored in `hosts_vars/vault/bitbucket-01.yml`. You can rename the `bitbucket-01.yml.sample` file and update it with secrets.


#### Encrypting with Ansible Vault

Add your password to a file named `.vault_pas` in the root directory.

**Encrypt secrets file**

```
$ ansible-vault encrypt host_vars/vault/bitbucket_01.yml --vault-password-file .vault_pass
```

**View secrets**

```
$ ansible-vault view host_vars/vault/bitbucket_01.yml --vault-password-file .vault_pass
```


### Inventory File

1. Replace `<host-ip>` with your remote host IP.
2. Replace `<host-user>` with your remote host user. You must enable passwordless sudo access.

```
web1 ansible_ssh_host=<host-ip>


[webservers]
web1

[dbservers]


[datacenter:children]
webservers
dbservers

[datacenter:vars]
ansible_ssh_user=<host-user>
```

## Run

#### Dry-run

```
$ ansible-playbook playbooks/bitbucket.yml  --vault-password-file .vault_pass --check
```

#### Dry-run

```
$ ansible-playbook playbooks/bitbucket.yml  --vault-password-file .vault_pass
```
