module Kspec
  class TestResult

    @results = []
    @count_failed = 0
    @count_test_success = 0
    @count_assert_success = 0

    def self.failed params
      item = TestResultItem.new
      item.context = params[:context]
      item.test = params[:test_name]
      item.status = :failed
      item.exception = params[:exception]
      @results << item
      @count_failed += 1
    end

    def self.assert_success
      item = TestResultItem.new
      item.status = :assert_success
      @results << item
      @count_assert_success += 1
    end

    def self.test_success
      item = TestResultItem.new
      item.context = params[:context]
      item.test = params[:test_name]
      item.status = :success
      @results << item
      @count_test_success += 1
    end

    def self.print
      @results.each do |result|
        result.print
      end
    end
  end
end
