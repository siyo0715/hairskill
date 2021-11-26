require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe '新規登録画面のテスト' do
    before do
      visit '/users/sign_up'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
    end
  end

  describe '参加画面のテスト' do
    before do
      visit '/users/sign_in'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'パスワード変更画面のテスト' do
    before do
      visit '/users/password/new'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/password/new'
      end
    end

    describe '連絡画面のテスト' do
      before do
        visit '/about'
      end

      context '表示内容の確認' do
        it 'URLが正しい' do
          expect(current_path).to eq '/about'
        end
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    it 'HairSkillリンクが表示される: 左上から1番目のリンクが「HairSkill」である' do
      home_link = find_all('a')[0].native.inner_text
      expect(home_link).to match(/HairSkill/)
    end
    it 'ゲストログインリンクが表示される: 左上から2番目のリンクが「ゲストログイン」である' do
      home_link = find_all('a')[1].native.inner_text
      expect(home_link).to match(/ゲストログイン/)
    end
    it '新規登録リンクが表示される: 左上から3番目のリンクが「新規登録」である' do
      sign_up_link = find_all('a')[2].native.inner_text
      expect(sign_up_link).to match(/新規登録/)
    end
    it '参加リンクが表示される: 左上から4番目のリンクが「参加」である' do
      sign_in_link = find_all('a')[3].native.inner_text
      expect(sign_in_link).to match(/参加/)
    end
    it '連絡リンクが表示される: 左上から5番目のリンクが「連絡」である' do
      contact_link = find_all('a')[4].native.inner_text
      expect(contact_link).to match(/連絡/)
    end
  end
end
