require "bacon"
require File.expand_path('../../lib/roadmap/language', __FILE__)
require File.expand_path('../../lib/roadmap/language/translation', __FILE__)
require File.expand_path('../test_language', __FILE__)

Roadmap::Language.use :test

describe 'Language.translate' do
  it '(:login) should return "Login"' do
    Roadmap::Language.translate(:login).should.equal 'Login'
  end

  it '("login") should return "Login"' do
    Roadmap::Language.translate('login').should.equal 'Login'
  end

  it '(:x_open, 5) should return "5 Open"' do
    Roadmap::Language.translate(:x_open, 5).should.equal "5 Open"
  end

  it '(:x_and_x, ["This", "that"]) should return "This and that"' do
    Roadmap::Language.translate(:x_and_x, ['This', 'that']).should.equal "This and that"
  end

  it '(:parent) should return "Parent"' do
    Roadmap::Language.translate(:parent).should.equal "Parent"
  end

  it '("parent.sub") should return "Sub"' do
    Roadmap::Language.translate('parent.sub').should.equal "Sub"
  end

  it '([:parent, :sub]) should return "Sub"' do
    Roadmap::Language.translate([:parent, :sub]).should.equal "Sub"
  end

  it '(:bad) should return "[bad]"' do
    Roadmap::Language.translate(:bad).should.equal "[bad]"
  end

  it '("even.more.bad") should return [even.more.bad]' do
    Roadmap::Language.translate('even.more.bad').should.equal "[even.more.bad]"
  end

  it '(:x_issues, 0) should return "0 issues"' do
    Roadmap::Language.translate(:x_issues, 0).should.equal "0 issues"
  end

  it '(:x_issues, 1) should return "1 issue"' do
    Roadmap::Language.translate(:x_issues, 1).should.equal "1 issue"
  end

  it '(:x_issues, 2) should return "2 issues"' do
    Roadmap::Language.translate(:x_issues, 2).should.equal "2 issues"
  end
end