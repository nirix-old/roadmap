describe 'User Routes' do
  extend Rack::Test::Methods

  def app
    Roadmap::App
  end

  it 'should display register form' do
    get '/register'
    last_response.body.should.include '<h2 class="page-title">Register</h2>'
  end

  it 'should register user' do
    post('/register', { user: { name: 'Tester', username: 'tester', password: 'test', email: 'tester@example.com' }})
    follow_redirect!
    last_request.path_info.should.equal '/login'
  end

  it 'should display login form' do
    get '/login'
    last_response.body.should.include '<h2 class="page-title">Login</h2>'
  end

  it 'should login user in' do
    post '/login', { username: 'tester', password: 'test' }
    follow_redirect!
    last_request.path_info.should.equal '/'
  end
end
