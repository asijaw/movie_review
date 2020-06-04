User.create(username: 'asija', password: "123")
User.create(username: 'user2', password: "456")
User.create(username: "mom", password: "moml1f3")
User.create(username: "dad", password: "dadsru13")

User.find(1).movies << Movie.new(title: "Finding Nemo", year: 2000, genre: "Disney")
User.find(2).movies << Movie.new(title: "The Lion King", year: 1994, genre: "Disney")
User.find(3).movies << Movie.new(title: "Black Panther", year: 2018, genre: "Marvel")
User.find(4).movies << Movie.new(title: "Avengers: Infinity War", year: 2018, genre: "Marvel")

Review.create(content: "Just keep swimming", rating: 4, user_id: 1, movie_id: 1)
Review.create(content: "I just can't wait to be king", rating: 4.2, user_id: 2, movie_id: 2)
Review.create(content: "Wakanda Forever!", rating: 3.5, user_id: 3, movie_id: 3)
Review.create(content: "Long live Thanos", rating: 3, user_id: 4, movie_id: 4)