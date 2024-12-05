class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :username, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  
  def own?(post)
    posts.include?(post)  # 投稿がユーザーのものかどうかをチェック
  end

  def bookmark(board)
    bookmark_boards << board
  end
  
  def unbookmark(board)
    bookmark_boards.destroy(board)
  end
  
  def bookmark?(board)
    bookmark_boards.include?(board)
  end
end
