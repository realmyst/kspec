class Kspec::TestSuite
  @test_list = []
  @context = false

  def initialize(context)
    @context = context
  end

  def run(result)

  end

  def add_test(name)
    @test_list << name
  end

  def add_tests(names)
    @test_list = @test_list | names
  end

end
