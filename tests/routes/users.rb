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
    post('/register', { user: { name: 'User', username: 'user', password: 'user', email: 'user@example.com' }})
    follow_redirect!
    last_request.path_info.should.equal '/login'
  end

  it 'should display login form' do
    get '/login'
    last_response.body.should.include '<h2 class="page-title">Login</h2>'
  end

  it 'should login user in' do
    post '/login', { username: 'user', password: 'user' }
    follow_redirect!
    last_request.path_info.should.equal '/'
  end

  it 'should display link to usercp' do
    get '/'
    last_response.body.should.include 'UserCP'
  end

  it 'should log user out' do
    get '/logout'
    follow_redirect!
    last_response.body.should.include 'Login'
  end
end
