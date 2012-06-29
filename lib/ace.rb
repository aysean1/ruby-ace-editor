require 'ace/version'

module Ace
  PATH = File.expand_path("..", __FILE__)

  def self.path
    PATH
  end

  def self.modules
    @modules ||= Dir["#{path}/ace/**/*.js"].map { |fn| fn.sub("#{path}/", "").sub(".js", "") }.sort
  end

  # Rails "Magic"
  if defined? ::Rails::Railtie
    class Railtie < ::Rails::Railtie
      initializer "ace" do |app|
        app.config.assets.paths << Ace.path
      end
    end
  end
end
