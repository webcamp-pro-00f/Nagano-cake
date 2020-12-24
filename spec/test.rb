require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'トップ画面のテスト' do
    context '表示内容の確認' do
      before do
        get root_path
      end
      it 'リクエストは200 okとなる' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ようこそ、NaganoCakeへ！")
      end
    end
  end
end