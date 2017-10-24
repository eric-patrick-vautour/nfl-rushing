require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class NflRushingsControllerTest < ActionController::TestCase
  test 'should get index' do
    NflRushing.create!(player: 'Player1', team: 'JAX')
    NflRushing.create!(player: 'Player2', team: 'MIN')
    get :index

    assert_response :success
    assert_template 'index'
    assert_equal ['Player1', 'Player2'], assigns(:nfl_rushings).collect(&:player)
  end
  
  test 'should get index with search' do
    NflRushing.create!(player: 'Player1', team: 'JAX')
    NflRushing.create!(player: 'Player2', team: 'MIN')
    get :index, q: {player_cont: 'Player1'}

    assert_response :success
    assert_template 'index'
    assert_equal ['Player1'], assigns(:nfl_rushings).collect(&:player)
  end
end