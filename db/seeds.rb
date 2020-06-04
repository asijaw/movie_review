User.create(username: 'asija', password: "123")
User.create(username: 'user2', password: "456")
User.create(username: "mom", password: "moml1f3")
User.create(username: "dad", password: "dadsru13")

User.find(1).movies << Movie.new(title: "Finding Nemo", year: 2000, genre: "Disney")
User.find(2).movies << Movie.new(title: "The Lion King", year: 1994, genre: "Disney")
User.find(3).movies << Movie.new(title: "Black Panther", year: 2018, genre: "Marvel")
User.find(4).movies << Movie.new(title: "Avengers: Infinity War", year: 2018, genre: "Marvel")

