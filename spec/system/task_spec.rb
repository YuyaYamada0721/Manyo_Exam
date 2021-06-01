require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task) }
  before do
    visit tasks_path
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[task_name]', with: 'あああ'
        fill_in 'task[task_content]', with: 'いいい'
        click_on 'タスク登録'
        expect(page).to have_content 'あああ'
        expect(page).to have_content 'いいい'
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
        FactoryBot.create(:task2)
        FactoryBot.create(:task3)
        visit tasks_path
        task = all('.task_row')
        expect(task[0]).to have_content 'test_name3'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        click_on '詳細'
        expect(page).to have_content 'test_name'
      end
    end
  end
end
