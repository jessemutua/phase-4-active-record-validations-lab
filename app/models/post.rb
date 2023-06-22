class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'], message: "is not included in the list" }

    validate :sufficiently_clickbait_title
    validates :summary, length: { maximum:250 }


    private
    def sufficiently_clickbait_title
        unless title.present? && title.match?(/(Won't Believe|Secret|Top \d+|Guess)/)
            errors.add(:title, "must be sufficiently clickbait-y")
        end
    end

end
