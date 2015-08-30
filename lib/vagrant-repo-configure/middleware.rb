module Vagrant
	module RepoConfigure
		class Middleware
		  def initialize(app, env)
		    @app = app
		  end

		  def call(env)
		  	vm      = env[:vm] || env[:machine]

			vm.communicate.sudo('mv /etc/apt/sources.list /etc/apt/sources.list.old')

		  	vm.config.repos.apt_lines.each do |line|
		  		vm.communicate.sudo("echo #{line} >> /etc/apt/sources.list")
		  		env[:ui].info "Added #{line} to sources list"
		  	end

		    @app.call(env)
		  end
		end
	end
end