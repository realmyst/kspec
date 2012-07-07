module Kspec
  class TestCase
    @@at_exit_running ||= false

    def tear_up; end
    def tear_down; end

    def initialize
    end

    def assert(*args)
      assert_true(*args)
    end

    def assert_true(arg)
      if arg
        success
      else
        failed
      end
    end

    def success
      TestResult.assert_success
    end

    def failed(msg = "")
      raise Kspec::Exception.new msg
    end

    at_exit do
      run unless @@at_exit_running
      @@at_exit_running = true
    end

    class << self
      attr_accessor :suites, :result

      def run
        descendants.each do |klass|
          @suites = []
          suite = TestSuite.new(klass)
          test_list = klass.instance_methods.grep /test/
          suite.add_tests(test_list)
          @suites << suite
        end

        run_suites
      end

      def run_suites
        @suites.each do |suite|
          suite.run
        end

        finalize
      end

      def finalize
        TestResult.print
      end

      def descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
