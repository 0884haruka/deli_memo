class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image
  has_many :likes, dependent: :destroy
  has_many :liked_members, through: :likes, source: :review #いいねランキング

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  #いいねブックマーク
  has_many :bookmarks, dependent: :destroy


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def liked_by?(member)
    likes.exists?(member_id: member.id)
  end

    # フォローしたときの処理
  def follow(member_id)
    relationships.create(followed_id: member_id)
  end
  # フォローを外すときの処理
  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end
  # フォローしているか判定
  def following?(member_id)
    followings.include?(member_id)
  end

  def self.guest
    find_or_create_by!(name: 'guestmember' ,nick_name: 'guestmember',email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
    end
  end

  def self.looks(search, word)
    if search == "partial_match"
      @member = Member.where("name LIKE?","%#{word}%")
    else
      @member = Member.all
    end
  end

end
