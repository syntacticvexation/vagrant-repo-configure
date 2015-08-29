require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'vagrant-repo-configure/config'
require 'vagrant-repo-configure/plugin'
require 'vagrant-repo-configure/middleware'
