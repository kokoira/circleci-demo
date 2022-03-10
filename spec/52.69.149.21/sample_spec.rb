require 'spec_helper'

# 22番ポートがListenしているか
describe port(22) do
  it { should be_listening }
end

# 80番ポートがListenしているか
describe port(80) do
  it { should be_listening }
end

# Node.jsがインストールされているか
describe package('nodejs') do
  it { should be_installed }
end

# Yarnがインストールされているか
describe package('yarn') do
  it { should be_installed }
end

# Rubyに関するパッケージがインストールされているか
%w{git gcc gcc-c++ openssl-devel libyaml-devel readline-devel zlib-devel libffi-devel}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Ruby2.6.3がインストールされているか
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.6\.3/ }
end

# MySQLに関するパッケージがインストールされているか
%w{mysql-community-server mysql-community-devel MySQL-python}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# MySQLが起動していて、且つ自動起動設定がされているか
describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

# Rails6.0.4.1がインストールされているか
describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Rails 6\.0\.4\.1/ }
end

# unicorn.rbが指定のパスに存在するか
describe file('/home/ec2-user/environment/cloud9-RaiseTech-4-5/config/unicorn.rb') do
  it { should be_file }
end

# nginx.confが指定のパスに存在するか
describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end

# cloud9-RaiseTech-4-5.confが指定のパスに存在するか
describe file('/etc/nginx/conf.d/cloud9-RaiseTech-4-5.conf') do
  it { should be_file }
end

# Nginxが起動していて、且つ自動起動設定がされているか
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end