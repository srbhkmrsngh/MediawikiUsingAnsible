# MediawikiUsingAnsible

```
Use Jenkins Job to provide password variable value from jenkins and use build step "shell execute". Or If you want, you can run the job from command line by providing variable's values on command line:

terraform init -lock=false

terraform plan -lock=false -var "access_key=${access_key}" -var "secret_key=${secret_key}" -var "RootPassword=${RootPassword}" -var "UserPassword=${UserPassword}"

terraform apply --auto-approve -lock=false -var "access_key=${access_key}" -var "secret_key=${secret_key}" -var "RootPasswordViaJenkins=${RootPassword}" -var "UserPassword=${UserPassword}"

Note1: Ansible playbooks is inherited into Terraform module
Note2: You need to configure Ansible and terraform on your system. And keep ssh private key at proper location so that it can access your server.
```



