require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let(:cut) { create(:cut, user: user) }
  let(:color) { create(:color, user: user) }
  let(:perm) { create(:perm, user: user) }
  let(:blog) { create(:blog, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

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

  describe '技術画面のテスト' do
    before do
      visit '/users/skill'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/skill'
      end
    end
  end

  describe 'カット一覧画面のテスト' do
    before do
      visit '/cuts'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/cuts'
      end
    end
  end

  describe 'カット詳細画面のテスト' do
    before do
      visit '/cuts/'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/cuts/'
      end
    end
  end

  describe 'カット編集画面のテスト' do
    before do
      visit edit_cut_path(cut)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/cuts/' + cut.id.to_s + '/edit'
      end
    end
  end

  describe 'カラー一覧画面のテスト' do
    before do
      visit '/colors'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/colors'
      end
    end
  end

  describe 'カラー詳細画面のテスト' do
    before do
      visit '/colors/'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/colors/'
      end
    end
  end

  describe 'カラー編集画面のテスト' do
    before do
      visit edit_color_path(color)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/colors/' + color.id.to_s + '/edit'
      end
    end
  end

  describe 'パーマ一覧画面のテスト' do
    before do
      visit '/perms'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/perms'
      end
    end
  end

  describe 'パーマ詳細画面のテスト' do
    before do
      visit '/perms/'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/perms/'
      end
    end
  end

  describe 'パーマ編集画面のテスト' do
    before do
      visit edit_perm_path(perm)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/perms/' + perm.id.to_s + '/edit'
      end
    end
  end

  describe 'カレンダー一覧のテスト' do
    before do
      visit '/blogs'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/blogs'
      end
    end
  describe 'カレンダー詳細画面のテスト' do
    before do
      visit '/blogs/'
    end
    describe 'カレンダー編集画面のテスト' do
    before do
      visit edit_blog_path(blog)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/blogs/' + blog.id.to_s + '/edit'
      end
    end
  end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/blogs/'
      end
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
  describe 'ヘッダーのテスト: ログインしている場合' do
    before do
      visit root_path
    end

    it 'HairSkillリンクが表示される: 左上から1番目のリンクが「HairSkill」である' do
      home_link = find_all('a')[0].native.inner_text
      expect(home_link).to match(/HairSkill/)
    end
    it '技術リンクが表示される: 左上から2番目のリンクが「技術」である' do
      users_skill_link = find_all('a')[1].native.inner_text
      expect(users_skill_link).to match(/技術/)
    end
    it '情報リンクが表示される: 左上から3番目のリンクが「情報」である' do
      users_information_link = find_all('a')[2].native.inner_text
      expect(users_information_link).to match(/情報/)
    end
    it 'カレンダーリンクが表示される: 左上から4番目のリンクが「カレンダー」である' do
      users_blog_link = find_all('a')[3].native.inner_text
      expect(users_blog_link).to match(/カレンダー/)
    end
    # it '変更が表示される: 左上から5番目のリンクが「変更」である' do
    #   users_edit_link = find_all('a')[4].native.inner_text
    #   expect(users_edit_link).to match(/変更/)
    # end
    # it '連絡リンクが表示される: 左上から6番目のリンクが「連絡」である' do
    #   contact_link = find_all('a')[5].native.inner_text
    #   expect(contact_link).to match(/連絡/)
    # end
  end
end