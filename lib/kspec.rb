require "kspec/version"

module Kspec
  autoload 'TestCase', 'kspec/test_case'
  autoload 'TestRunner', 'kspec/test_runner'
  autoload "TestResult", "kspec/test_result"
  autoload "TestSuite", "kspec/test_suite"


  def call
    TestCase.run
  end
end
