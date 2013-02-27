describe 'User Routes' do
  extend Rack::Test::Methods

  def app
    Roadmap::App
  end

  it 'should get login' do
    get '/login'
    last_response.body.should.include '<h2 class="page-title">Login</h2>'
  end

  it 'should get register' do
    get '/register'
    last_response.body.should.include '<h2 class="page-title">Register</h2>'
  end
end
