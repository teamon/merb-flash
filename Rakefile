begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "merb-flash"
    gemspec.summary = gemspec.description = "Merb plugin that provides rails-like flash messages"
    gemspec.email = "i@teamon.eu"
    gemspec.homepage = "http://github.com/teamon/merb-flash"
    gemspec.authors = ["Tymon Tobolski"]
    gemspec.add_dependency('merb-core', '>= 1.0')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run specs"
task :spec do
  system("spec -O spec/spec.opts spec")
end