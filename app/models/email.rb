# class Email
#   def self.send_email(user, body)
#     Pony.options = {
#       :via => :smtp,
#       :via_options => {
#         :address              => 'smtp.gmail.com',
#         :port                 => '587',
#         :enable_starttls_auto => true,
#         :user_name            => 'teamboom12345678@gmail.com',
#         :password             => 'passwordteamboom',
#         :authentication       => :plain,
#         :domain               => "localhost.localdomain"
#       }
#     }
#
#     Pony.mail :to => user.email,
#     :from => 'Team Boom!',
#     :subject => "Congratulations on completing a calendar event :D",
#     :body => body
#   end
# end
