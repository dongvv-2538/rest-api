# -*- encoding: utf-8 -*-
# stub: jsom-pagination 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jsom-pagination".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/useo-pl/jsom-pagination/releases", "homepage_uri" => "https://github.com/useo-pl/jsom-pagination", "source_code_uri" => "https://github.com/useo-pl/jsom-pagination" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sebastian Wilgosz".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-05-20"
  s.description = "    Easy to use, framework-agnostic set of methods useful for\n    integrating JSON:API in your project.\n".freeze
  s.email = ["sebastian@driggl.com".freeze]
  s.homepage = "https://github.com/useo-pl/jsom-pagination".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "A pagination support for JSON:API based web applications.".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<dry-struct>.freeze, ["~> 1.3.0"])
    s.add_runtime_dependency(%q<pagy>.freeze, ["~> 3.8.3"])
    s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.3", ">= 2.3.7"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov-cobertura>.freeze, [">= 0"])
  else
    s.add_dependency(%q<dry-struct>.freeze, ["~> 1.3.0"])
    s.add_dependency(%q<pagy>.freeze, ["~> 3.8.3"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.3", ">= 2.3.7"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-cobertura>.freeze, [">= 0"])
  end
end
