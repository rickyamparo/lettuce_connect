puts "Starting to seed"
rick = User.create(first_name: "Rick", last_name: "Deckard", email: "blade@runner.com", password: "replicants")
luke = User.create(first_name: "Luke", last_name: "Skywalker", email: "force@jedi.com", password: "whomprats")
david = User.create(first_name: "David", last_name: "Lightman", email: "war@games.com", password: "whoppr")
kevin = User.create(first_name: "Kevin", last_name: "Flynn", email: "tron@mcu.com", password: "disc")
ricky = User.create(first_name: "Ricky", last_name: "Amparo", email: "rickyamparo@gmail.com", password: "admin")

github = HandleType.create(name: 'github')
twitter = HandleType.create(name: 'twitter')
linkedin = HandleType.create(name: 'linkedin')

Handle.create(user: rick, name: 'rickdeckard', handle_type: github)
Handle.create(user: rick, name: 'rickdeckard', handle_type: twitter)
Handle.create(user: rick, name: 'rickdeckard', handle_type: linkedin)

Handle.create(user: luke, name: 'lukeskywalker', handle_type: github)
Handle.create(user: luke, name: 'lukeskywalker', handle_type: twitter)
Handle.create(user: luke, name: 'lukeskywalker', handle_type: linkedin)

Handle.create(user: david, name: 'davidlightman', handle_type: github)
Handle.create(user: david, name: 'davidlightman', handle_type: twitter)
Handle.create(user: david, name: 'davidlightman', handle_type: linkedin)

Handle.create(user: kevin, name: 'kevinflynn', handle_type: github)
Handle.create(user: kevin, name: 'kevinflynn', handle_type: twitter)
Handle.create(user: kevin, name: 'kevinflynn', handle_type: linkedin)

Handle.create(user: ricky, name: 'rickyamparo', handle_type: github)
Handle.create(user: ricky, name: 'rickyaceamparo', handle_type: twitter)
Handle.create(user: ricky, name: 'rickyamparo', handle_type: linkedin)

Connection.create(user: rick, scanned_id: luke.id)
Connection.create(user: rick, scanned_id: david.id)
Connection.create(user: rick, scanned_id: kevin.id)
Connection.create(user: rick, scanned_id: ricky.id)

Connection.create(user: luke, scanned_id: rick.id)
Connection.create(user: luke, scanned_id: david.id)
Connection.create(user: luke, scanned_id: kevin.id)

Connection.create(user: david, scanned_id: rick.id)
Connection.create(user: david, scanned_id: luke.id)
Connection.create(user: david, scanned_id: kevin.id)

puts "Seeding has finished"
