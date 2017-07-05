require 'uri'

module Vagrant
  module RepoConfigure
    class Config < Vagrant.plugin(2, :config)
    	attr_accessor :apt_lines

      def initialize
        @apt_lines = UNSET_VALUE
      end

      def use_ubuntu_mirror(mirror,release)
        source_repos = %w(main restricted universe multiverse)

        add_source(mirror, release, source_repos)
        add_source(mirror, "#{release}-security", source_repos)
        add_source(mirror, "#{release}-updates", source_repos)
      end

      def add_source(location, release, repos)
          @apt_lines = [] if @apt_lines == UNSET_VALUE

          @apt_lines << "deb #{location} #{release} #{repos.join(' ')}"
      end

      def add(line)
      	@apt_lines = [] if @apt_lines == UNSET_VALUE

      	@apt_lines << line
      end

      def validate(machine)
        errors = _detected_errors

        @apt_lines.each do |line|
        	line_parts = line.split

        	unless line_parts.length > 3
        		errors << 'Invalid repo line - not enough tokens'
        	end

        	first_word = ['deb', 'deb-src']

        	word = line_parts.shift
        	unless first_word.include? word
        		errors << "Invalid repo line - first token must be either #{first_word.join(' or ')} not #{word}"
        	end

        	word = line_parts.shift

        	unless word =~ /\A#{URI::regexp(['http', 'https', 'ftp'])}\z/
        		errors << "Invalid repo line - second token must be a valid URL not #{word}"
        	end

        	line_parts.each do |part|
        		unless part =~ /\A[\w\-\d]+\z/
        			errors << "Invalid repo line - invalid distribution or section tokens (#{part})"
        		end
        	end
        end

        {'repo-configure' => errors}
      end

      def finalize!
      	@apt_lines = [] if @apt_lines == UNSET_VALUE
	  end

    end
  end
end
