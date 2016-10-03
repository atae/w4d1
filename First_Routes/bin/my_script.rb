require 'addressable/uri'
require 'rest-client'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html',
      query_values: {
        'some_category[a_key]' => 'another value',
        'some_category[a_second_key]' => 'yet another value',
        'some_category[inner_inner_hash][key]' => 'value',
        'something_else' => 'aaahhhhh'
      }
    ).to_s

    puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

# rescue
  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def update_user(id,name,email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s



  puts RestClient.patch(
    url,
    { user: { name: name, email: email } }
  )



end
# create_user("Gary", "betterthanAsh@gmail.com")
update_user("5","Gary","eeveeboi@gmail.com")
# index_users
