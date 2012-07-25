DBCNF = {
  driver:   'mysql2',
  host:     '127.0.0.1',
  user:     'root',
  pass:     'root',
  database: 'roadmap'
}

DB = Sequel.connect("#{DBCNF[:driver]}://#{DBCNF[:user]}:#{DBCNF[:pass]}@#{DBCNF[:host]}/#{DBCNF[:database]}")