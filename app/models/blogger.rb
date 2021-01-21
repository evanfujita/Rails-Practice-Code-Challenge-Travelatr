class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def total_likes
        self.posts.map do |post|
            post.likes
        end.sum
    end
end
