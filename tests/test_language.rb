Roadmap::Language::Translation.add do |translation|
  translation.name = "Test"
  translation.language = :test

  translation.translate do |t|
    t['login']            = "Login"
    t['x_open']           = "{1} Open"
    t['x_issues']         = "{plural:{1}, [{1} issue|{1} issues]}"
    t['x_and_x']          = "{1} and {2}"
    t['parent']           = "Parent"
    t['parent.sub']       = "Sub"
    t['parent.more.test'] = "Test"
  end
end
