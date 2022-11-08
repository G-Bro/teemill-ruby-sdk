# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'gbro_teemill'
  s.version = '0.0.4'
  s.summary = 'An SDK for the Teemill API'
  s.files = Dir['lib/**/**.rb']
  s.authors = ['G-Bro']
  s.license = 'MIT'
  s.homepage = 'https://teemill.com/api-docs/'
  s.metadata = {
    'source_code_uri' => 'https://github.com/G-Bro/teemill-ruby-sdk'
  }

  s.add_development_dependency 'json', '~> 1.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'minitest-silence'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'spy'

  s.required_ruby_version = '>= 2.6.0'
end
