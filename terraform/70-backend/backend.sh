#!/bin/bash
component=$1
environment=$2

echo component is $component and environment is $environment
dnf install ansible -y
ansible-pull -i localhost, -U <url> main.yaml -e component=$component -e environment=$environment