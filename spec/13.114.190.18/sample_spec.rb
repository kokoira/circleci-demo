require 'spec_helper'

#ec2-userのグループが存在するか確認する
describe group('ec2-user') do
  it { should exist }
end


#ポート22をListenしているか確認する
describe port("22") do
  it { should be_listening }
end

#ポート80をListenしているか確認する
describe port("80") do
  it { should be_listening }
end

#gitがインストールされているか確認する
describe package('git') do
  it { should be_installed }
end   

#nodejsがインストールされているか確認する
describe package('nodejs') do
  it { should be_installed }
end

#rubyをインストールするために必要なパッケージがインストールされているか確認する
%w{gcc gcc-c++ openssl-devel libyaml-devel readline-devel zlib-devel sqlite-devel libselinux-python }.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

#mysqlのパッケージがインストールされているか確認する
%w{yum-utils MySQL-python mysql-community-server mysql-community-devel }.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end


#ruby -vのコマンドでruby 2.6.3p62のバージョンがマッチングしているか確認
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 2\.6\.3/ }
end


#rails -vのコマンドでRails6.0.3のバージョンがマッチングしているか確認
describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /Rails 6\.0\.3/ }
end


#unicorn -vのコマンドでunicorn v6.1.0のバージョンがマッチングしているか確認
describe command('unicorn -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /unicorn v6\.1\.0/ }
end

#nginx.confのフォルダがあるか確認
describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end

#nginxが起動しているか確認
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end