require 'spec_helper'

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe package('nodejs') do
  it { should be_installed }
end

describe package('yarn') do
  it { should be_installed }
end

%w{git gcc gcc-c++ openssl-devel libyaml-devel readline-devel zlib-devel libffi-devel}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.6\.3/ }
end

%w{mysql-community-server mysql-community-devel MySQL-python}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Rails 6\.0\.4\.1/ }
end

describe file('/home/ec2-user/environment/cloud9-RaiseTech-4-5/config/unicorn.rb') do
  it { should be_file }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end

describe file('/etc/nginx/conf.d/cloud9-RaiseTech-4-5.conf') do
  it { should be_file }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end