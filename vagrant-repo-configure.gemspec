require File.expand_path('../lib/vagrant-repo-configure/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'vagrant-repo-configure'
  s.version         = Vagrant::RepoConfigure::VERSION
  s.date            = '2015-08-29'
  s.summary         = "Add repo to VM"
  s.description     = "This plugin wipes the system repo list and adds custom repo lines"
  s.authors         = ["Syntactic Vexation"]
  s.email           = 'syntacticvexation@gmail.com'
  s.files           = `git ls-files`.split($\)
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths   = ['lib']
  s.homepage        = 'https://github.com/syntacticvexation/vagrant-repo-configure'
  s.license         = 'GPLv3'
end
