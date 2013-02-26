Sequel.migration do
  change do
    create_table(:groups) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      TrueClass :is_admin, :default=>false, :null=>false
    end
    
    create_table(:permissions) do
      primary_key :id, :type=>Bignum
      String :project_id, :size=>255, :null=>false
      String :context, :size=>255, :null=>false
      String :context_id, :size=>255, :null=>false
      String :action, :size=>255
      TrueClass :value, :null=>false
    end
    
    create_table(:projects) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      String :slug, :size=>255, :null=>false
      String :description, :text=>true
      TrueClass :enable_wiki, :default=>true, :null=>false
    end
    
    create_table(:settings) do
      primary_key :id, :type=>Bignum
      String :setting, :size=>255
      String :value, :text=>true, :null=>false
      String :type, :default=>"text", :size=>255
    end
    
    create_table(:statuses) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      TrueClass :is_open, :null=>false
      TrueClass :is_global, :default=>false, :null=>false
    end
    
    create_table(:types) do
      primary_key :id, :type=>Bignum
      String :name, :size=>255, :null=>false
      TrueClass :is_global, :default=>false, :null=>false
    end
    
    create_table(:users) do
      primary_key :id, :type=>Bignum
      String :username, :size=>255, :null=>false
      String :password, :size=>255, :null=>false
      String :email, :size=>255, :null=>false
      String :name, :size=>255
      String :group_id, :default=>"3", :size=>255, :null=>false
    end
  end
end
