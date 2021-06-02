require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task) }
  let!(:task3) { FactoryBot.create(:task3) }
  let!(:task2) { FactoryBot.create(:task2) }
  before do
    visit tasks_path
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[task_name]', with: 'あああ'
        fill_in 'task[task_content]', with: 'いいい'
        fill_in 'task[expiration_deadline]', with: '002021/06/03'
        click_on 'タスク登録'
        click_on '一覧画面へ戻る'
        expect(page).to have_content 'あああ'
        expect(page).to have_content 'いいい'
        expect(page).to have_content '2021-06-03'
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
        click_on '終了期限でソートする'
        task = all('.task_row')
        expect(task[0]).to have_content 'test_name3'
        expect(task[1]).to have_content 'test_name2'
        expect(task[2]).to have_content 'test_name'
      end
    end
  end
end
