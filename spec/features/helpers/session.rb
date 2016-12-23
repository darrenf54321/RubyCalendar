module EventHelpers
  def sign_up_one(email: 'batman@hotmail.com',
              password: '123456',
              password_confirmation: '123456',
              mobile_number: '')
    visit "/users/sign_up"
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password_confirmation
    fill_in :user_mobile_number, with: mobile_number
    click_button "Sign up"
  end
  def sign_up_two(email: 'riddler@hotmail.com',
              password: 'abcdef',
              password_confirmation: 'abcdef',
              mobile_number: '')
    visit "/users/sign_up"
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password_confirmation
    fill_in :user_mobile_number, with: mobile_number
    click_button "Sign up"
  end
end
