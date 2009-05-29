# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-flash}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tymon Tobolski"]
  s.date = %q{2009-05-29}
  s.description = %q{Merb plugin that provides rails-like flash messages}
  s.email = %q{i@teamon.eu}
  s.extra_rdoc_files = ["README.textile", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "TODO", "lib/merb-flash.rb", "spec/merb-flash_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://blog.teamon.eu/projekty/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Merb plugin that provides rails-like flash messages}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, [">= 1.0"])
    else
      s.add_dependency(%q<merb-core>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 1.0"])
  end
end
