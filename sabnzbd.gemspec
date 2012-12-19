# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sabnzbd"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Zwijnenburg"]
  s.date = "2012-12-19"
  s.description = "Ruby wrapper for the sabnzbd api. This gem can be used to gather status and download information from your sabnzb instance."
  s.email = "daniel@danielz.nl"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".autotest",
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "fixtures/vcr_cassettes/invalid_key.yml",
    "fixtures/vcr_cassettes/paused.yml",
    "fixtures/vcr_cassettes/simple_queue.yml",
    "fixtures/vcr_cassettes/slots.yml",
    "fixtures/vcr_cassettes/valid_key.yml",
    "lib/sabnzbd.rb",
    "lib/sabnzbd/slot.rb",
    "spec/sabnzbd_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/DanielZwijnenburg/sabnzbd"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Ruby wrapper for the sabnzbd api."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<autotest-growl>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<webmock>, ["~> 1.8.0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<autotest-growl>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<webmock>, ["~> 1.8.0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<autotest-growl>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end

