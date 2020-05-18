n = 0
16.times do |n|
  n = n + 1
  Game.create(
    title: "title#{n}", 
    company: "company#{n}", 
    price: n*1000,
    genre: n,
    released_at: "2020-05-#{n}"
    )

  user = User.new(
    name: "user#{n}", 
    email: "user#{n}@email", 
    password: "user#{n}pass"
    )
  user.skip_confirmation!
  user.save

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

    Comment.create(
      body: "commment_body#{n}",
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

user = User.new(
  name: "Guest", 
  email: "guest@example.com", 
  password: "pass_for_guest",
  introduce: "Thank you for your watching my review app, Guest!",
  admin: false
  )
user.skip_confirmation!
user.save

user = User.new(
  name: "Admin", 
  email: "admin@example.com", 
  password: "pass_for_admin",
  introduce: "Thank you for your watching my review app, Admin!",
  admin: true
  )
user.skip_confirmation!
user.save

16.times do |n|
  n = n + 1
  Game.create(
    title: "title#{n}", 
    company: "company#{n}", 
    price: n*1000,
    genre: n,
    released_at: "2020-05-#{n}"
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

    Comment.create(
      body: "commment_body#{n}",
      game_id: n+1,
      user_id: n+1
      )

    Favorite.create(
      game_id: n+2,
      user_id: n+2
    )

    Own.create(
      game_id: n+3,
      user_id: n+3
    )
end
