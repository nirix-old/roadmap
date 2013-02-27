describe 'Admin Routes' do
  extend Rack::Test::Methods

  def app
    Roadmap::App
  end

  it 'should get index' do
    set_sess(:user_id, 1)
    get '/admin'
    last_response.body.should.include '<h2 class="page-title">Dashboard</h2>'
  end

  it 'should deny access' do
    set_sess(:user_id, 2)
    get '/admin'
    follow_redirect!
    last_request.path_info.should.equal '/login'
  end
end
