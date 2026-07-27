# **Core Linux Networking**

<p align="justify">
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/linux/linux-original.svg" width="50" height="50"/>
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/debian/debian-original.svg" width="50" height="50"/>
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vagrant/vagrant-original.svg" width="50" height="50"/>
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ansible/ansible-original.svg" width="50" height="50"/>
</p>

The documentation will be expanded in the future. For now, here are a few key points to provide context for the project.

Keep in mind that Vagrant and Ansible are not required to develop this project. I chose to include them to automate infrastructure provisioning and to explore how these two technologies complement each other. Although they serve different purposes, they work together effectively in this context.

Most of the work in this repository is performed directly from the command line (CLI), so there will be relatively few version-controlled files. Please keep this in mind when reviewing the repository's structure and organization.

> [!NOTE]
> - [**Vagrant**](https://developer.hashicorp.com/vagrant) is used to automate the creation, startup, and destruction of virtual machines, making it easier to manage the study environment.
> - [**Ansible**](https://docs.ansible.com/) is responsible for infrastructure provisioning and machine configuration. This eliminates the need to manually access each VM to perform the same tasks on both the client and the server, ensuring greater consistency and automation across the environment.
