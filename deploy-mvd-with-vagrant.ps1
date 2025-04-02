
# TODO: Do gradle build before deploying to vms
cd deployment
vagrant up
vagrant destroy mvd-ansible-control-vm -f
