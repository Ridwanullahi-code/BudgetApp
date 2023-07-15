require 'rails_helper'

describe 'Budget App homepage' do
  it 'has a header with the text Budget App' do
    visit root_path
    expect(page).to have_css('h1.text-4xl.text-center.font-bold', text: 'Budget App')
  end

  it 'has two buttons, LOGIN IN and SIGN UP' do
    visit root_path
    expect(page).to have_link('LOGIN IN', href: new_user_session_path)
    expect(page).to have_link('SIGN UP', href: new_user_registration_path)
  end

  it 'the LOGIN IN button has a blue background color' do
    visit root_path
    expect(page).to have_css('a.bg-blue-600', text: 'LOGIN IN')
  end

  it 'the SIGN UP button has a transparent background color' do
    visit root_path
    expect(page).to have_css('a.bg-transparent', text: 'SIGN UP')
  end
end
