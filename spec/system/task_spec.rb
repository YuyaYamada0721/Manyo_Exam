require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  let!(:task2) { FactoryBot.create(:task2, user_id: user.id) }
  let!(:task3) { FactoryBot.create(:task3, user_id: user.id) }
  before do
    visit sessions_new_path
    fill_in 'session[email]', with: 'foo@foo.com'
    fill_in 'session[password]', with: 'foofoo'
    click_on 'ログインする'
    visit tasks_path
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: 'あああ'
        fill_in 'task[content]', with: 'いいい'
        fill_in 'task[expiration_deadline]', with: '002021/06/03'
        find('#task_status').all('option')[1].select_option
        click_on 'タスク登録'
        click_on '一覧画面へ戻る'
        expect(page).to have_content 'あああ'
        expect(page).to have_content 'いいい'
        expect(page).to have_content '2021-06-03'
        expect(page).to have_content '着手中'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'test_name'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task = all('.task_row')
        expect(task[0]).to have_content 'test_name3'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        first(:link, '詳細').click
        expect(page).to have_content 'test_name'
      end
    end
  end
  describe '終了期限降順機能' do
    context '終了期限でソートした場合' do
      it '終了期限が降順で表示される' do
        click_link '終了期限を降順'
        task = all('.task_row')
        expect(task[0]).to have_content 'test_name'
      end
    end
  end
  describe '検索機能' do
    context '検索をした場合' do
      it 'タイトルで検索できる' do
        fill_in 'task[name]', with: 'test_name2'
        click_on '検索'
        expect(page).to have_content 'test_name2'
        expect(page).to have_no_content 'test_name3'
      end
    end
    context 'タスク名であいまい検索をした場合' do
      it '検索キーワードを含むタスクで絞り込まれる' do
        fill_in 'task[name]', with: '3'
        click_on '検索'
        expect(page).to have_content 'test_name3'
      end
    end
    context 'ステータス検索した場合' do
      it 'ステータスに完全一致するタスクが絞り込まれる' do
        find("option[value='着手中']").select_option
        click_on '検索'
        expect(page).to have_content 'test_name2'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it '検索キーワードをタイトルに含み、かつステータスに完全一致するタスクが絞り込まれる' do
        fill_in 'task[name]', with: '3'
        find("option[value='未着手']").select_option
        click_on '検索'
        expect(page).to have_content 'test_name3'
        expect(page).to have_no_content 'test_name2'
      end
    end
  end
end
