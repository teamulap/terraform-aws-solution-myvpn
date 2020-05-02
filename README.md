# myVPN

[![CircleCI](https://circleci.com/gh/teamulap/terraform-aws-solution-myvpn/tree/master.svg?style=svg&circle-token=21755ccd79f2bfce0325c9f53b7471761286287f)](https://circleci.com/gh/teamulap/terraform-aws-solution-myvpn/tree/master)

A Basic Example of a VPN Infrastructure Setup created using Terraform Modules.

## Change Log
**v0.0.1**
- Creates a simple OpenVPN Solution
- T3.Nano Instance Type

## Future Plans
I do not plan to improve or maintain this repository any longer. We've decided to go for a more advanced approach of creating Terraform Solutions.

However, This repo will remain public for educational purposes.

## Modules Used
1. [Team Ulap AWS VPC Module](https://github.com/teamulap/terraform-aws-module-vpc)
1. [Team Ulap AWS Security Group Module](https://github.com/teamulap/terraform-aws-module-security-group)
1. [Team Ulap AWS EC2 Module](https://github.com/teamulap/terraform-aws-module-ec2)

## Software Installed
1. [OpenVPN](https://openvpn.net/) 

rm -rf .git
git init
git add .
git config user.name "jcbagtas"
git config user.email "17738997+jcbagtas@users.noreply.github.com"
git commit -m "Initial"
git remote add origin git@github.com:teamulap/terraform-aws-solution-myvpn.git
git push -u --force origin master