# frozen_string_literal: true

require_relative 'lib/amex_csv_to_ledger/version'

Gem::Specification.new do |spec|
  spec.name = 'amex_csv_to_ledger'
  spec.version = AmexCsvToLedger::VERSION
  spec.authors = ['baak6']
  spec.email = ['baak6@baak6.com']

  spec.summary = 'AMEX CSV to Ledger.'
  spec.description = 'Command line utility to convert AMEX CSV to Ledger.'
  spec.required_ruby_version = '>= 2.6.0'
  spec.license = 'GPL-3.0'

  spec.homepage = 'https://git.baak6.com/amex_csv_to_ledger.git/'
  spec.metadata['source_code_uri'] = 'https://git.baak6.com/amex_csv_to_ledger.git/'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|features)/)})
    end
  end
  spec.executables = ['amex_csv_to_ledger']
  spec.require_paths = ['lib']
end
