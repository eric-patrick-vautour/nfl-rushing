require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class NflRushingTest < ActiveSupport::TestCase
  test "should return csv" do
    NflRushing.create!(player: 'Player1', team: 'JAX')
    NflRushing.create!(player: 'Player2', team: 'MIN')
    @nfl_rushing = NflRushing.all
    
    expected_result = [["player", "team"], ["Player1", 'JAX'], ["Player2", 'MIN']]
    parsed_results = CSV.parse(NflRushing.to_csv(@nfl_rushing)).collect{|r| [r[0], r[1]]}
    assert_equal expected_result, parsed_results
  end
end