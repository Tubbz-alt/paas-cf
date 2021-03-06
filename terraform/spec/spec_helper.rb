require "English"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  #   config.filter_run :focus
  #   config.run_all_when_everything_filtered = true
  #   config.example_status_persistence_file_path = "spec/examples.txt"
  #   config.disable_monkey_patching!
  #   config.warnings = true
  #   if config.files_to_run.one?
  #     config.default_formatter = 'doc'
  #   end
  #
  #   config.profile_examples = 10
  #   config.order = :random
  #   Kernel.srand config.seed
end

hcl2json_path = `which hcl2json`
abort hcl2json_path unless $CHILD_STATUS.success?

if hcl2json_path == ""
  warn "Install hcl2json before running these tests"
  warn "go install github.com/tmccombs/hcl2json"
  exit(1)
end

TERRAFORM_PATH  = File.expand_path(File.join(__dir__, ".."))
TERRAFORM_FILES = Dir.glob(File.join(TERRAFORM_PATH, "**", "*.tf"))
