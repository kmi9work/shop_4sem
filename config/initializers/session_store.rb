# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Shop_session',
  :secret      => '0ff0b1d1d1687d2fee2ba5593ea3e42034c00641d6ebeb0251405908687ee15dfde983657dc576404b25e68ee843925bf6674165ea376c1e3d056307e38283f4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
