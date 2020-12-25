require 'rails_helper'

RSpec.describe "会員ログイン前のテスト" do
  describe "トップページのテスト" do
    before do
      visit root_path
    end
    context "ヘッダーのテスト" do
      it "新規登録を押すと、新規登録画面に遷移する" do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq new_customer_session_path
      end
    end
  end
end