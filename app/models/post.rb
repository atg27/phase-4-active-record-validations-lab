class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates :clickbait
end

def clickbait 
    if title
        strings = ["Won't Believe", "Secret", "Top", "Guess"]
        title_check = strings.select do |string|
            title.include?(string)
        end

        if title_check.empty?
            errors.add(:title, "must be sufficiently clickbaity")
        end
    end
end