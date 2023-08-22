# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip-optimizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'paperclip-optimizer'
  spec.version       = PaperclipOptimizer::VERSION
  spec.authors       = ['Andrey Lizunov']
  spec.email         = ['andrey.lizunov@republic.co']
  spec.description   = 'paperclip-optimizer is a Paperclip processor for optimizing and minifying uploaded images.'
  spec.summary       = 'Minify Paperclip image attachments like JPGs, GIFs or PNGs'
  spec.homepage      = 'https://github.com/joinrepublic/paperclip-optimizer'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.add_runtime_dependency 'kt-paperclip', '>= 6.4'
  spec.add_runtime_dependency 'image_optim', '~> 0.19'

  spec.add_development_dependency 'bundler', '~> 2.2.0'
  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rails', '>= 3.2.20'
  spec.add_development_dependency 'sqlite3', '~> 1.4.2'
  spec.add_development_dependency 'rubocop', '>= 1.54.0'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  
  spec.post_install_message = %q{
Initializer
-----------

run

    rails g paperclip_optimizer:install

to create an initializer for global configuration.

Breaking changes from 1.0.3
---------------------------

By default, all optimization libraries are now disabled. Re-enable jpegtran and optipng manually 
if you wish to retain the behaviour of PaperclipOptimizer 1.0.3.

See https://github.com/janfoeh/paperclip-optimizer#settings for more information on the new 
configuration system.

=============================================
IMPORTANT - READ THIS - IMPORTANT - READ THIS
=============================================

PaperclipOptimizer uses image_optim to do the heavy lifting. image_optim automatically inserts itself 
into the asset pipeline and tries to compress your /app/assets/images as well. By default, it enables 
all the optimization libraries it supports, and it will fail if you do not have all of them installed.

Either add

    config.assets.image_optim = false
    
to your config/application.rb to disable this, or check https://github.com/toy/image_optim#from-rails 
for how to configure this properly.
}
end
