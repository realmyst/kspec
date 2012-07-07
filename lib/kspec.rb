require "kspec/version"

module Kspec
  autoload 'TestCase', 'kspec/test_case'
  autoload 'TestRunner', 'kspec/test_runner'
  autoload "TestResult", "kspec/test_result"
  autoload "TestResultItem", "kspec/test_result_item"
  autoload "TestSuite", "kspec/test_suite"
  autoload "Exception", "kspec/exception"


  def call
    TestCase.run
  end
end
