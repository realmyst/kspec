require 'test_helper'

class TestCaseKspec < Kspec::TestCase

  def test_assert_true
    assert true
  end

  def test_assert_false
    assert false
  end

  def test_assert_both
    assert true
    assert false
  end
end
