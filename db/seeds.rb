5.times do |n|
  n = n + 1
  Game.create(
    title: "title#{n}", 
    company: "company#{n}", 
    price: n*1000,
    genre: n
    )

  User.create(
    name: "user#{n}", 
    email: "user#{n}@email", 
    password: "user#{n}pass"
    )

  Review.create(
    direction: n,
    operability: n,
    story: n,
    volume: n,
    like: n,
    body: "コメント#{n}",
    game_id: n,
    user_id: n
    )

    Favorite.create(
      game_id: n,
      user_id: n
    )

    Own.create(
      game_id: n,
      user_id: n
    )

end