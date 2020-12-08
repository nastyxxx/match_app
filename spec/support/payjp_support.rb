# frozen_string_literal: true

module PayjpSupport
  def fill_in_card
    payjp_customer = double('Payjp::Customer')
    payjp_list = double('Payjp::ListObject')
    payjp_card = double('Payjp::Card')
    allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
    allow(payjp_customer).to receive(:cards).and_return(payjp_list)
    allow(payjp_list).to receive(:create).and_return(payjp_card)
    allow(payjp_customer).to receive(:id).and_return('cus_ca9d1d98900ec1f2595aebefd9a6')

    fill_in 'number', with: '4242424242424242'
    fill_in 'cvc', with: '123'
    select '4', from: 'exp_month'
    select '24', from: 'exp_year'
    click_on 'Register'
  end
end
