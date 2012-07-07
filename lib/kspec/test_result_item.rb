module Kspec
  class TestResultItem
    @context = nil
    @test = nil
    @status = nil
    @exception = nil

    attr_accessor :context, :test, :status, :exception

    def print
      msg = []
      msg << @status if @status
      msg << @context.name if @context
      msg << @test if @test
      msg << @exception.message if @exception
      msg << @exception.backtrace if @exception
      puts msg.join("\n")
    end
  end
end
