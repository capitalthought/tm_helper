# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "tm_helper"
    gem.summary = %Q{Helper for Ruby development in TextMate.}
    gem.description = %Q{}
    gem.email = "billdoughty@capitalthought.com"
    gem.homepage = "http://github.com/capitalthought/tm_helper"
    gem.authors = ["shock"]
    gem.add_development_dependency "activesupport", ">= 2.3.8"    
  end
  #Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake'
require 'rake/rdoctask'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new( :spec ) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format progress'
#  t.rcov = true
end

task :default => :spec

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RailsBridge'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

