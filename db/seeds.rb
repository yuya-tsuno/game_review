# シードデータ14個
n = 0
14.times do |n|
  n = n + 1 
  Game.create(
    title: "title#{n}", 
    company: "company#{n}", 
    price: n*1000,
    genre: n,
    released_at: "2020-05-#{n}",
    icon: File.open("./app/assets/images/seed_game/Assassin's Creed 4 Black Flag.jpg"),
    )

  user = User.new(
    name: "user#{n}", 
    email: "user#{n}@e.mail", 
    password: "user#{n}pass",
    icon: File.open("./app/assets/images/seed_user/アルノ.jpg"),
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
    body: "レビュー本文#{n}",
    game_id: n,
    user_id: n,
    )

    Comment.create(
      body: "コメント本文#{n}",
      game_id: n,
      user_id: n,
      )

    Favorite.create(
      game_id: n,
      user_id: n,
    )

    Own.create(
      game_id: n,
      user_id: n,
    )
end

# ゲストユーザー用シードデータ
guest_user = User.new(
  # id: 15,
  name: "Guest", 
  email: "guest@example.com", 
  password: "pass_for_guest",
  introduce: "Thank you for your watching my review app, Guest!",
  admin: false,
  icon: File.open("./app/assets/images/seed_user/三玖.png"),
  )
guest_user.skip_confirmation!
guest_user.save

10.times do |n|
  n = n + 1 
  Review.create(
    direction: n,
    operability: n,
    story: n,
    volume: n,
    like: n,
    summary: "Guestによるレビューの要約#{n}",
    body: "Guestによるレビューの本文#{n}",
    game_id: n,
    user_id: 15,
    )

    Comment.create(
      body: "Guestによるコメントの本文#{n}",
      game_id: n,
      user_id: 15,
      )

    Favorite.create(
      game_id: n,
      user_id: 15,
    )

    Own.create(
      game_id: n,
      user_id: 15,
    )
end

# ゲストユーザー（管理者）用シードデータ
admin_user = User.new(
  # id: 16,
  name: "Admin", 
  email: "admin@example.com", 
  password: "pass_for_admin",
  introduce: "Thank you for your watching my review app, Admin!",
  admin: true,
  icon: File.open("./app/assets/images/seed_user/一花.png"),
  )
admin_user.skip_confirmation!
admin_user.save

10.times do |n|
  n = n + 1 
  Review.create(
    direction: n,
    operability: n,
    story: n,
    volume: n,
    like: n,
    summary: "Adminによるレビューの要約#{n}",
    body: "Adminによるレビューの本文#{n}",
    game_id: n,
    user_id: 16,
    )

    Comment.create(
      body: "Adminによるコメントの本文#{n}",
      game_id: n,
      user_id: 16,
      )

    Favorite.create(
      game_id: n,
      user_id: 16,
    )

    Own.create(
      game_id: n,
      user_id: 16,
    )
end