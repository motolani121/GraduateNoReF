class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendship
  has_many :friend, :through => :friendship
  has_many :inverse_friendship, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friend, :through => :inverse_friendship, :source => :user
  has_many :posts
  has_many :comments


  acts_as_messageable

end

def name
  :email
end

def mailboxer_email(object)
 :email
end

