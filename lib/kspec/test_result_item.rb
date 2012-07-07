module Kspec
  class TestResultItem
    @context = nil
    @test = nil
    @status = nil
    @exception = nil

    attr_accessor :context, :test, :status, :exception

    def failed?
      @status == :failed
    end
 end
end
