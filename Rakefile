require 'rake/clean'

directory "tmp/"
CLEAN.include "tmp/"

file "tmp/ace" => "tmp/" do
  cd "tmp/" do
    sh "git clone git://github.com/ajaxorg/ace.git"
  end
end

task :build => "tmp/ace" do
  cd "tmp/ace" do
    sh "git pull"
    sh "npm install"
    sh "node ./Makefile.dryice.js -nc"
  end
end

file "lib/ace/version.rb" => :build do |f|
  version = nil
  cd "tmp/ace" do
    version = `git describe --tags`.chomp
    major, minor, sha = version.sub(/^v/, "").split('-')
    version = "#{major}.#{minor}"
  end

  File.open(f.name, 'w') do |io|
    io.write "module Ace\n  VERSION = #{version.inspect}\nend\n"
  end
end
CLOBBER.include "lib/ace/version.rb"

file "lib/ace.js" => :build do |f|
  cp "tmp/ace/build/src-noconflict/ace.js", f.name
end
CLOBBER.include "lib/ace.js"

%w( keybinding mode theme worker ).each do |mod|
  directory "lib/ace/#{mod}"
  task mod => [:build, "lib/ace/#{mod}"] do |t|
    Dir["tmp/ace/build/src-noconflict/#{t.name}-*.js"].each do |src|
      cp src, "lib/ace/#{t.name}/#{File.basename(src).sub("#{t.name}-", "")}"
    end
  end
  CLOBBER.include "lib/ace/#{mod}"
end

task :default => ["lib/ace/version.rb", "lib/ace.js", :keybinding, :mode, :theme, :worker]
