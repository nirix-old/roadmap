describe 'Project Routes' do
  extend Rack::Test::Methods

  def app
    Roadmap::App
  end

  it 'should get index' do
    get '/'
    last_response.body.should.include '<h2 class="page-title">Projects</h2>'
  end
end
