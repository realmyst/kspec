module Kspec
  class TestResult
    @@results = []
    @@count_failed = 0
    @@count_test_success = 0
    @@count_assert_success = 0

    class << self
      def results
        @@results
      end

      def count_failed
        @@count_failed
      end

      def count_test_success
        @@count_test_success
      end

      def count_assert_success
        @@count_assert_success
      end

      def count_total
        count_failed + count_test_success
      end

      def failed params
        item = TestResultItem.new
        item.context = params[:context]
        item.test = params[:test]
        item.status = :failed
        item.exception = params[:exception]
        @@results << item
        @@count_failed += 1
        TestReporterBase.report item
      end

      def assert_success
        item = TestResultItem.new
        item.status = :assert_success
        @@results << item
        @@count_assert_success += 1
      end

      def test_success
        item = TestResultItem.new
        item.status = :test_success
        @@results << item
        @@count_test_success += 1
        TestReporterBase.report item
      end

      def print
        @results.each do |result|
          result.print
        end
      end
    end
  end
end
