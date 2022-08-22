class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    @userSent = User.find(@post.user_id)
    mail to: @userSent.email, subject: "Email de confirmation de la publication du post !"
  end
end
