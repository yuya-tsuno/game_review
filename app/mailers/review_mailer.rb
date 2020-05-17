class ReviewMailer < ApplicationMailer
  def inform_mail(inform)
    @inform = inform
    mail to: "2ch.yuya@gmail.com", subject: "登録ゲームの新規レビューお知らせメール"
  end
end
