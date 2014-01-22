class RecipeMailer < ActionMailer::Base
  default from: "admin@example.com"
  
  def share_recipe_email(user, url)
    @user = user
    @url = url
    mail(
      :to => user.email,
      :subject => "#{user.username} thinks you would like this tasty recipe!"
    )
  end
end
