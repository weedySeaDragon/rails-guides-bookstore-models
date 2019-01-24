class Customer < ApplicationRecord
  has_many :orders
  has_many :reviews

  scope :frequent_buyers, -> { where 'orders_count > 150' }

  include Person


  # The reviews_to_publish method below is expected to return a Relation.
  # It might be called like this:
  # @pub_reviews = customer.reviews_to_publish.where(id: params[:id])

  # Determine which reviews should be published based on how many 1 star ratings
  # a Customer has.
  # Too many 1 star ratings may mean they are a troll or bot.
  #
  # returns a Relation of all reviews for this Customer that should be published
  def reviews_to_publish

    reviews_by_rating = reviews.group(:rating).count

    case reviews_by_rating.fetch(1, 0)
    when (0..1)
      reviews # publish them all
    when (2..18)
      reviews.where(state: %i[published not_reviewed])
    when (19..Float::INFINITY)
      # looks like a troll; don't show any
      #   in Ruby 2.6, this can be replaced with when 19..
      Review.none # => The caller will not have to check for nil
    else
      reviews.published # only publish those already published (no change)
    end

  end

end
