#
# These modules REQUIRE at least puppet 4.9 or higher
#
echo 'Installing required packages...'
yum install git puppet-agent-1.9.3 --nogpg -y > /dev/null 2>&1

echo 'Setting up software dir...'
ln -s /vagrant/software /software # Only on vagrant
#
#
echo 'Setting up deployments dir...'
ln -s /vagrant/bar_files /etc/puppetlabs/code/environments/production/bar_files
#
# Install librarian puppet. We need this to download the correct set of puppet modules
#
echo 'Installing required gems...'
/opt/puppetlabs/puppet/bin/gem install activesupport:4.2.7.1 librarian-puppet awesome_print --no-rdoc --no-ri > /dev/null 2>&1

#
# Setting up ssh access
#
echo 'Setting up ssh access'
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

echo 'Installing required puppet modules...'
cd /vagrant
/opt/puppetlabs/puppet/bin/librarian-puppet install

#
# Setup software directory
#
echo 'Setting up software directory...'
dirname=/vagrant/modules/software/files
if [ -d $dirname ]; then
  rm -rf $dirname
else
  rm -f $dirname
fi

#
# Setup hiera search and backend. We need this to config our systems
#
echo 'Setting up hiera directories...'
rm -f /etc/puppetlabs/puppet/hiera.yaml /etc/puppetlabs/hiera.yaml /etc/puppetlabs/code/hiera.yaml
ln -sf /vagrant/hiera.yaml /etc/puppetlabs/code/environments/production/hiera.yaml

dirname=/etc/puppetlabs/code/environments/production/hieradata
if [ -d $dirname ]; then
  rm -rf $dirname
else
  rm -f $dirname
fi
ln -sf /vagrant/hieradata /etc/puppetlabs/code/environments/production

#
# Configure the puppet path's
#
echo 'Setting up Puppet module directories...'
dirname=/etc/puppetlabs/code/environments/production/modules
if [ -d $dirname ]; then
  rm -rf $dirname
else
  rm -f $dirname
fi
ln -sf /vagrant/modules /etc/puppetlabs/code/environments/production

echo 'Setting up Puppet manifest directories...'
dirname=/etc/puppetlabs/code/environments/production/manifests
if [ -d $dirname ]; then
  rm -rf $dirname
else
  rm -f $dirname
fi
ln -sf /vagrant/manifests /etc/puppetlabs/code/environments/production
