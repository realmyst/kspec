module Kspec
  class TestSuite

    def initialize(context)
      @test_list = []
      @context = context
    end

    def run
      @test_list.each do |test|
        run_test test
      end
    end

    def run_test test
      context_object = @context.new
      context_object.tear_up
      context_object.send(test)
      context_object.tear_down
    rescue Exception => e
      TestResult.failed :exception => e, :context => @context, :test => test
    end

    def add_test(name)
      @test_list << name
    end

    def add_tests(names)
      @test_list = @test_list | names
    end

  end
end
