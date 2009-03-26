# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{opencongress-ruby}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Shettler"]
  s.date = %q{2009-03-25}
  s.email = %q{dave@opencongress.org}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/opencongress", "lib/opencongress/bill.rb", "lib/opencongress/blog_post.rb", "lib/opencongress/news_post.rb", "lib/opencongress/person.rb", "lib/opencongress/person_stat.rb", "lib/opencongress/roll_call.rb", "lib/opencongress/roll_call_comparison.rb", "lib/opencongress/voting_comparison.rb", "lib/opencongress_ruby.rb", "test/opencongress_ruby_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/opencongress/opencongress-ruby}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{OpenCongress API ruby binding}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
