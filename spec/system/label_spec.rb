require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  let!(:lebel) { FactoryBot.create(:label) }
  let!(:lebel2) { FactoryBot.create(:label2) }
  before do
    visit sessions_new_path
    fill_in 'session[user_email]', with: 'foo@foo.com'
    fill_in 'session[password]', with: 'foofoo'
    click_on 'ログインする'
    visit tasks_path
  end
  describe 'ラベル登録機能' do
    context 'タスクを新規作成時、ラベルを選択した場合' do
      it 'ラベルが登録される' do
        visit new_task_path
        fill_in 'task[task_name]', with: 'あああ'
        fill_in 'task[task_content]', with: 'いいい'
        fill_in 'task[expiration_deadline]', with: '002021/06/03'
        find('#task_status').all('option')[1].select_option
        check 'Ruby'
        click_on 'タスク登録'
        click_on '一覧画面へ戻る'
        expect(page).to have_content 'Ruby'
      end
    end
    context 'ラベルを複数登録した場合' do
      it '複数のラベルが登録される' do
        visit new_task_path
        fill_in 'task[task_name]', with: 'あああ'
        fill_in 'task[task_content]', with: 'いいい'
        fill_in 'task[expiration_deadline]', with: '002021/06/03'
        find('#task_status').all('option')[1].select_option
        check 'Ruby'
        check 'Java'
        click_on 'タスク登録'
        click_on '一覧画面へ戻る'
        expect(page).to have_content 'Ruby'
        expect(page).to have_content 'Java'
      end
    end
  end
  describe 'ラベル編集機能' do
    context 'タスク編集時にラベルの選択を変更した場合' do
      it '変更したラベルに変わる' do
        click_on '編集'
        check 'Ruby'
        check 'Java'
        click_on 'タスク登録'
        expect(page).to have_content 'Ruby'
        expect(page).to have_content 'Java'
      end
    end
  end
  describe 'ラベル詳細表示機能' do
    context 'ラベルを登録した場合' do
      it '詳細画面で登録したラベル一覧が表示される' do
        click_on '編集'
        check 'Ruby'
        check 'Java'
        click_on 'タスク登録'
        click_on '詳細'
        expect(page).to have_content 'Ruby'
        expect(page).to have_content 'Java'
      end
    end
  end
  describe 'ラベル検索機能' do
    context '一覧画面でラベルを検索した場合' do
      it '検索に引っかかるタスクが表示される' do
        click_on '編集'
        check 'Ruby'
        click_on 'タスク登録'
        visit new_task_path
        fill_in 'task[task_name]', with: 'あああ'
        fill_in 'task[task_content]', with: 'いいい'
        fill_in 'task[expiration_deadline]', with: '002021/06/03'
        find('#task_status').all('option')[1].select_option
        check 'Java'
        click_on 'タスク登録'
        click_on '一覧画面へ戻る'
        select 'Ruby', from: 'task[label_id]'
        click_on '検索'
        expect(page).to have_content 'Ruby'
        expect(page).to have_content 'test_name'
        expect(page).to have_no_content 'あああ'
        expect(page).to have_no_content 'いいい'
      end
    end
  end
end
