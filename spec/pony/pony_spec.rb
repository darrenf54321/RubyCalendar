
# describe Pony do
#
#   before(:each) do
#     allow(Pony).to receive(:deliver)
#   end
#
#   it "sends mail" do
#     expect(Pony).to receive(:deliver) do |mail|
#       expect(mail.to).to eq [ 'batman@hotmail.com' ]
#       expect(mail.from).to eq [ 'teamboom12345678@gmail.com' ]
#       expect(mail.subject).to eq 'Congratulations on completing a calendar event :D'
#       expect(mail.body).to eq "Congratulations"
#     end
#     Pony.mail(:to => 'batman@hotmail.com', :from => 'teamboom12345678@gmail.com', :subject => 'Congratulations on completing a calendar event :D', :body => 'Congratulations')
#   end
#
# end
