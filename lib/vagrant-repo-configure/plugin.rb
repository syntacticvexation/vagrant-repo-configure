module Vagrant

    module RepoConfigure

        class Plugin < Vagrant.plugin('2')
          name "RepoConfigure"

          description <<-DESC
          This plugin wipes the system repo list and adds custom repo lines
          DESC

          config :repos do
            require_relative 'config'
            Config
          end

          action_hook('repoconfigure') do |hook|
              hook.after(Vagrant::Action::Builtin::WaitForCommunicator, Vagrant::RepoConfigure::Middleware)
          end
        end
    end
end
