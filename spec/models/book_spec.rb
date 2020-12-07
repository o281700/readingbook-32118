require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '新規投稿' do
    context '新規投稿ができるとき' do
      it '全ての値が正しく入力されていると投稿できる' do
        expect(@book).to be_valid
      end
      it 'impressionが空でも投稿できる' do
        @book.impression = ''
        expect(@book).to be_valid
      end
    end
    context '新規投稿ができないとき' do
      it 'titleが空だと投稿できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Title can't be blank")
      end
      it 'authorが空だと投稿できないこと' do
        @book.author = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Author can't be blank")
      end
      it 'userと紐づいていないと投稿できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("User must exist")
      end
    end
  end
end
