# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_c3c_session',
  :secret      => '5e794cef8f6ff6b8b50cfc496cd0ebc36c0927c3bf7012fb81f6321016b56c8fedcaccaedfc5ee4fd8aa62e2481068cc7cbc3a75dde022915a8367ebb0d50796'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
