require "bacon"
require File.expand_path('../../lib/roadmap/libs/language', __FILE__)
require File.expand_path('../test_locale', __FILE__)
LOCALE = Roadmap::Language.load('test')

describe 'Language.translate' do
  it '(:login) should return "Login"' do
    LOCALE.translate(:login).should.equal 'Login'
  end

  it '("login") should return "Login"' do
    LOCALE.translate('login').should.equal 'Login'
  end

  it '(:x_open, 5) should return "5 Open"' do
    LOCALE.translate(:x_open, 5).should.equal "5 Open"
  end

  it '(:x_and_x, ["This", "that"]) should return "This and that"' do
    LOCALE.translate(:x_and_x, ['This', 'that']).should.equal "This and that"
  end

  it '(:parent) should return "Parent"' do
    LOCALE.translate(:parent).should.equal "Parent"
  end

  it '("parent.sub") should return "Sub"' do
    LOCALE.translate('parent.sub').should.equal "Sub"
  end

  it '([:parent, :sub]) should return "Sub"' do
    LOCALE.translate([:parent, :sub]).should.equal "Sub"
  end

  it '(:bad) should return "[bad]"' do
    LOCALE.translate(:bad).should.equal "[bad]"
  end

  it '("even.more.bad") should return [even.more.bad]' do
    LOCALE.translate('even.more.bad').should.equal "[even.more.bad]"
  end

  it '(:x_issues, 0) should return "0 issues"' do
    LOCALE.translate(:x_issues, 0).should.equal "0 issues"
  end

  it '(:x_issues, 1) should return "1 issue"' do
    LOCALE.translate(:x_issues, 1).should.equal "1 issue"
  end

  it '(:x_issues, 2) should return "2 issues"' do
    LOCALE.translate(:x_issues, 2).should.equal "2 issues"
  end
end