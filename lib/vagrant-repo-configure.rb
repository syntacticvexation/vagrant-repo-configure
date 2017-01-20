begin
  require 'vagrant'
rescue LoadError
  require 'bundler'
  Bundler.require(:default, :development)
end

require 'vagrant-repo-configure/config'
require 'vagrant-repo-configure/plugin'
require 'vagrant-repo-configure/middleware'
