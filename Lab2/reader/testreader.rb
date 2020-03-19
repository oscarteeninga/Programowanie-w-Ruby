require 'minitest/autorun'
load 'reader.rb'


# Tests
class ReaderTest < MiniTest::Test
  def setup
    @input1 = "Pomidorek210"
    @input2 = "Maryjane420"
    @input3 = "120"
    @input4 = "420Małgorzata"
    @input5 = "KotIPies"
    @input6 = "ąłóśćęź"
  end
 
  def test_word_number()
    assert_equal(reader(@input1)[0], "Pomidorek")
    assert_equal(reader(@input1)[1], "210")
  end

  def test_word_number2()
    assert_equal(reader(@input2)[0], "Maryjane")
    assert_equal(reader(@input2)[1], "420")
  end

  def test_number()
    assert_equal(reader(@input3)[0], "")
    assert_equal(reader(@input3)[1], "120")
  end

  def test_number_word()
    assert_equal(reader(@input4)[0], "Małgorzata")
    assert_equal(reader(@input4)[1], "420")
  end

  def test_word()
    assert_equal(reader(@input5)[0], "KotIPies")
    assert_equal(reader(@input5)[1], "")
  end

  def test_word_pl()
    assert_equal(reader(@input6)[0], "ąłóśćęź")
    assert_equal(reader(@input6)[1], "")
  end
end