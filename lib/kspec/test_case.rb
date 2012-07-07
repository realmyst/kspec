module Kspec
  class TestCase
    @@at_exit_running ||= false

    def tear_up; end
    def tear_down; end

    def assert(*args)
      assert_true(*args)
    end

    def assert_true(arg)

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
          @result = TestResult.new
          suite = TestSuite.new(klass)
          test_list = klass.instance_methods.grep /test/
          suite.add_tests(test_list)
          @suites << suite
        end

        run_suites
      end

      def run_suites
        @suites.each do |suite|
          suite.run(@result)
        end

        finalize
      end

      def finalize
        @result.print
      end

      def descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end
    end
  end
end
