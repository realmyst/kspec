module Kspec
  class TestReporterBase
    def self.report item
      case item.status
        when :test_success
          print '.'
        when :failed
          print 'F'
        when :errored
          print 'E'
      end
    end

    def self.result_report result
      puts "\n\n"
      result.results.each do |item|
        next unless (item.failed? || item.errored?)

        puts "##{item.context} #{item.test}"
        puts "#{item.exception.message}" unless item.exception.message.empty?
        lines = item.exception.backtrace.select{|a| !a.match('lib/kspec')}
        puts lines.join("\n")
        puts
      end

      puts "Total: #{result.count_total} Success: #{result.count_test_success} Failed: #{result.count_failed} Assertions: #{result.count_assert_success}"
    end
  end
end
