# -*- encoding: utf-8 -*-
# stub: jsonapi_errors_handler 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jsonapi_errors_handler".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/driggl/jsonapi_errors_handler", "source_code_uri" => "https://github.com/driggl/jsonapi_errors_handler" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sebastian Wilgosz".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-11-18"
  s.description = "This gem is a convienient wrapper for your application errors.\nIt allows you to map any error to a nicely formatted standard HTTP error response.\n".freeze
  s.email = ["sebastian@driggl.com".freeze]
  s.homepage = "https://github.com/driggl/jsonapi_errors_handler".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "A JSON API error handler for ruby applications.".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov-cobertura>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-cobertura>.freeze, [">= 0"])
  end
end
