require File.expand_path("../lib/ace/version", __FILE__)

Gem::Specification.new do |s|
  s.name    = "ace-editor"
  s.version = Ace::VERSION

  s.homepage = "https://github.com/josh/ruby-ace-editor"
  s.summary  = "Ace Cloud9 Editor JS assets for Sprockets/Rails"
  s.description = "Neatly packaged Ace Cloud9 Editor JS assets for use in Sprockets or the Rails 3 asset pipeline."

  s.files = Dir["README.md", "lib/**/*"]

  s.add_dependency "sprockets", "~> 2.0"

  s.author = "Joshua Peek"
  s.email  = "josh@joshpeek.com"
end
