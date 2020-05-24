class ReviewMailer < ApplicationMailer
  def inform_mail(review, send_user)
    @review = review
    @send_user = send_user
    mail to: send_user.email, subject: "#{review.game.title}に新しいレビューがとどきました！"
  end
end
