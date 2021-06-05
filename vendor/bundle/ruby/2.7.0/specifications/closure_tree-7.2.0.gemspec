# -*- encoding: utf-8 -*-
# stub: closure_tree 7.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "closure_tree".freeze
  s.version = "7.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matthew McEachen".freeze]
  s.date = "2020-09-03"
  s.description = "Easily and efficiently make your ActiveRecord model support hierarchies".freeze
  s.email = ["matthew-github@mceachen.org".freeze]
  s.homepage = "http://mceachen.github.io/closure_tree/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Easily and efficiently make your ActiveRecord model support hierarchies".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.2.10"])
    s.add_runtime_dependency(%q<with_advisory_lock>.freeze, [">= 4.0.0"])
    s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_development_dependency(%q<generator_spec>.freeze, [">= 0"])
    s.add_development_dependency(%q<parallel>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-instafail>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.2.10"])
    s.add_dependency(%q<with_advisory_lock>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<generator_spec>.freeze, [">= 0"])
    s.add_dependency(%q<parallel>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-instafail>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<timecop>.freeze, [">= 0"])
  end
end
