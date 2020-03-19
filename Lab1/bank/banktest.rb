require 'minitest/autorun'
load 'bank.rb'


# Tests
class BankTest < MiniTest::Test
  def setup
    @command1 = "Oscar Teeninga:2:120"
    @command2 = "Maciej Kazalski:1:100"
    @command3 = "Oscar Teeninga:2:100"
    @command4 = "Maciej Kazalski:1:-120"
    @command5 = "Maciej Kazalski:2:200:fadassda"
    @command6 = "Maciej Kazalski:2:fdafa"
    @command7 = "Maciej Kazalski:2"
  end
 
  def test_add_on_account1
    clients = {}
    interpret_command(clients, @command1)
    name = "Oscar Teeninga"
    acc = "2"
    value = 120
    assert_equal(clients[name][acc], value)
  end
 
  def test_add_on_account2
    clients = {}
    interpret_command(clients, @command2)
    name = "Maciej Kazalski"
    acc = "1"
    value = 100
    assert_equal(clients[name][acc], value)
  end

  def test_add_on_account3
    clients = {}
    interpret_command(clients, @command1)
    interpret_command(clients, @command3)
    name = "Oscar Teeninga"
    acc = "2"
    value = 220
    assert_equal(clients[name][acc], value)
  end

  def test_add_on_account4
    clients = {}
    interpret_command(clients, @command2)
    interpret_command(clients, @command4)
    name = "Maciej Kazalski"
    acc = "1"
    value = 100
    assert_equal(clients[name][acc], value)
  end

  def test_add_on_account5
    clients = {}
    interpret_command(clients, @command5)
    name = "Maciej Kazalski"
    acc = "2"
    value = 200
    assert_equal(clients[name][acc], value)
  end

  def test_add_on_account6
    clients = {}
    interpret_command(clients, @command6)
    interpret_command(clients, @command5)
    name = "Maciej Kazalski"
    acc = "2"
    value = 200
    assert_equal(clients[name][acc], value)
  end

  def test_add_on_account7
    clients = {}
    interpret_command(clients, @command5)
    interpret_command(clients, @command7)
    name = "Maciej Kazalski"
    acc = "2"
    value = 200
    assert_equal(clients[name][acc], value)
  end

  def test_unallocated_space
    clients = {}
    interpret_command(clients, @command7)
    assert_equal(clients["Oscar"], nil)
  end

end