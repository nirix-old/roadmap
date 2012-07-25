class Locale_test < Roadmap::Locale
  def info
    {
      :name => "Test",
      :name_short => :te,
      :locale => :ST,
      :dir => 'ltr',
      :author => "Jack P."
    }
  end

  def strings
    {
      :login => "Login",
      :x_open => "{1} Open",
      :x_issues => "{plural:{1}, [{1} issue|{1} issues]}",
      :x_and_x => "{1} and {2}",

      :parent => {
        :_this => "Parent",
        :sub => "Sub",

        :more => {
          :test => "Test"
        }
      }
    }
  end
end