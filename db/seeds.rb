User.create(username: 'asija', password: "123")
User.create(username: 'user2', password: "456")
User.create(username: "mom", password: "moml1f3")
User.create(username: "dad", password: "dadsru13")

User.find(1).movies << Movie.new(title: "Finding Nemo", year: 2000, genre: "Disney", review_attr: [content: "Just keep swimming", rating: 4])
User.find(2).movies << Movie.new(title: "The Lion King", year: 1994, genre: "Disney", review_attr: [content: "I just can't wait to be king", rating: 4.2])
User.find(3).movies << Movie.new(title: "Black Panther", year: 2018, genre: "Marvel", , review_attr: [content: "Wakanda Forever!", rating: 3.5])
User.find(4).movies << Movie.new(title: "Avengers: Infinity War", year: 2018, genre: "Marvel", review_attr: [content: "Long live Thanos", rating: 3])

