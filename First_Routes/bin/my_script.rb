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

def create_user(username)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

# rescue
  puts RestClient.post(
    url,
    { user: { username: username } }
  )
end


def create_contact(name, email, user_id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

# rescue
  puts RestClient.post(
    url,
    { contact: { name: name, email: email, user_id: user_id } }
  )
end

def update_user(id, username)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}.json"
  ).to_s

  puts RestClient.patch(
    url,
    { user: { username: username } }
  )
end

def update_contact(id, name, email, user_id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/contacts/#{id}.json"
  ).to_s

  puts RestClient.patch(
    url,
    { contact: { name: name, email: email, user_id: user_id } }
  )
end
update_contact("1","Pikachu", "pikapika@pika.pika", "1")
