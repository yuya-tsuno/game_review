n = 0
14.times do |n|
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
    summary: "レビューの要約#{n}",
    body: "レビューのコメント本文#{n}",
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

guest_user = User.new(
  name: "Guest", 
  email: "guest@example.com", 
  password: "pass_for_guest",
  introduce: "Thank you for your watching my review app, Guest!",
  admin: false
  )
guest_user.skip_confirmation!
guest_user.save

admin_user = User.new(
  name: "Admin", 
  email: "admin@example.com", 
  password: "pass_for_admin",
  introduce: "Thank you for your watching my review app, Admin!",
  admin: true
  )
admin_user.skip_confirmation!
admin_user.save

Game.create(
  title: "non_review_title", 
  company: "non_named_company", 
  price: 1,
  genre: 4,
  released_at: "2020-04-04"
  )
