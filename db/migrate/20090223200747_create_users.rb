class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :login

      t.string :movil
      t.string :fijo
      t.string :rol, :default => 'user'

      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip

      t.timestamps
    end

    u = User.new(:name => 'Dani', :login => 'danigb@gmail.com', :rol => 'sudo');
    u.password = "dani"
    u.password_confirmation = "dani"
    u.save!



  end

  def self.down
    drop_table :users
  end
end
