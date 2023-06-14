class Review < ApplicationRecord
  belongs_to :member
  has_one_attached :review_image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum prefecture:{
    "都道府県を選択ください":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }

  enum food_category:{
    "カテゴリを選択ください":0,
    肉・肉加工品:1,魚介類・魚加工品:2,野菜・野菜加工品:3,乳製品・チーズ:4,
    スイーツ・和菓子:5,豆腐・豆加工品:6,麺類・パン・米:7,漬物・ふりかけ:8,
    調味料:9,お惣菜:10
  }

  def get_review_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def liked_by?(member)
    likes.exists?(member_id: member.id)
  end

  def self.looks(search, word)
    if search == "partial_match"
      @review = Review.where("name LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

end
