# Generic Ansible Samples with Workflows

This project illustrates how GitHub runners can be used to manage compute resources using Ansible.

## Simple Linux Example

By default, GitHub runners have Ansible installed. You just need to use it.  This [example workflow](https://github.com/AsperitasConsulting/ansible-samples/actions/workflows/ansible-execute.yml) illustrates how. This workflow does the following:
* Downloads a private SSH key from an Azure Key Vault and stores it in a pem file. Note this file will automatically be cleaned up after the run.
* It executes an [Ansible Playbook](https://github.com/AsperitasConsulting/ansible-samples/blob/linux_basic/playbooks/linux-basic.yml) against an inventory of VMs. This playbook will ensure that Python prerequisites for Ansible are installed and execute a short test task.

> Note: You need to fork this repository to run it

The setup for this sample requires an Azure subscription and a DEMO environment with the following secrets described [here](https://github.com/AsperitasConsulting/reusable-workflows/tree/main?tab=readme-ov-file#required-secrets).

## Sample Resources

This example relies on an Azure key vault for the private SSH key used for login. It also relies on VMs for Ansible to manage. Infrastructure code to create these resources are listed below. Note that these VMs have public IP addresses as our runners are not in network.

| Terraform configuration | Description |
| --- | --- |
| [```vault_setup```](https://github.com/AsperitasConsulting/ansible-samples/tree/linux_basic/infrastructure/azure/vault_setup) | Defines an Azure key vault, generates an SSH key, and stores that key as a secret in the vault. |
| [```vm_setup```](https://github.com/AsperitasConsulting/ansible-samples/tree/linux_basic/infrastructure/azure/vm_setup) | Defines a virtual network, subnet, and a virtual machine hosted in the subnet. |