module ReviewsHelper
  def display_votes(review)
    votes = review.votes_for.size
    return count_votes(votes)
  end

  private

  def count_votes(votes)
    votes.to_s + 'Like(s)'
  end
end
