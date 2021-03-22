# MediawikiUsingAnsible

```
Use Following Two Jenkins Job using build step "shell execute":

1. First Job to run Terraform to create infrastructure

terraform init -lock=false
terraform plan -lock=false -var "access_key=${access_key}" -var "secret_key=${secret_key}" 
terraform apply --auto-approve -lock=false -var "access_key=${access_key}" 

2. Second downstream job to run Ansible to cofnigure mediawiki

ansible-playbook site.yml --extra-vars '{"mysql_root_password":"${RootPasswordViaJenkins}","mysql_wikiuser_password":"${UserPasswordViaJenkins}"}'
```



