require 'rails_helper'
RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(name: '', task_content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(name: '失敗テスト', task_content: '')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(name: '成功テスト', task_content: '成功テスト')
        expect(task).to be_valid
      end
    end
  end
end
RSpec.describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task) }
    let!(:task2) { FactoryBot.create(:task2) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it '検索キーワードを含むタスクが絞り込まれる' do
        expect(Task.name_fuzzy_search(2)).to include(task2)
        expect(Task.name_fuzzy_search(2)).not_to include(task)
        expect(Task.name_fuzzy_search(2).count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it 'ステータスに完全一致するタスクが絞り込まれる' do
        expect(Task.status_search(1)).to include(task2)
        expect(Task.status_search(1)).not_to include(task)
        expect(Task.status_search(1).count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it '検索キーワードをタイトルに含み、かつステータスに完全一致するタスクが絞り込まれる' do
        expect(Task.name_fuzzy_search(2).status_search(1)).to include(task2)
        expect(Task.name_fuzzy_search(2).status_search(1)).not_to include(task)
        expect(Task.name_fuzzy_search(2).status_search(1).count).to eq 1
      end
    end
  end
end
