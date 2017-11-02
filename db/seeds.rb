puts "Starting to seed"
rick = User.create(first_name: "Rick", last_name: "Deckard", email: "blade@runner.com", password: "replicants")
luke = User.create(first_name: "Luke", last_name: "Skywalker", email: "force@jedi.com", password: "whomprats")
david = User.create(first_name: "David", last_name: "Lightman", email: "war@games.com", password: "whoppr")
kevin = User.create(first_name: "Kevin", last_name: "Flynn", email: "tron@mcu.com", password: "disc")

Handle.create(user: rick, name: 'rickdeckard')
Handle.create(user: rick, name: 'rickdeckard')
Handle.create(user: rick, name: 'rickdeckard')

Handle.create(user: luke, name: 'lukeskywalker')
Handle.create(user: luke, name: 'lukeskywalker')
Handle.create(user: luke, name: 'lukeskywalker')

Handle.create(user: david, name: 'davidlightman')
Handle.create(user: david, name: 'davidlightman')
Handle.create(user: david, name: 'davidlightman')

Handle.create(user: kevin, name: 'kevinflynn')
Handle.create(user: kevin, name: 'kevinflynn')
Handle.create(user: kevin, name: 'kevinflynn')

Connection.create(user: rick, scanned_id: luke.id)
Connection.create(user: rick, scanned_id: david.id)
Connection.create(user: rick, scanned_id: kevin.id)

Connection.create(user: luke, scanned_id: rick.id)
Connection.create(user: luke, scanned_id: david.id)
Connection.create(user: luke, scanned_id: kevin.id)

Connection.create(user: david, scanned_id: rick.id)
Connection.create(user: david, scanned_id: luke.id)
Connection.create(user: david, scanned_id: kevin.id)

puts "Seeding has finished"
