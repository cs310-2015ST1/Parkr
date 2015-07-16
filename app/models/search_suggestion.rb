class SearchSuggestion
  def self.seed
    User.find_each do |user|
      name = user.name
      1.upto(name.length - 1) do |n|
        prefix = name[0, n]
        $redis.zadd "search-suggestions:#{prefix.downcase}", 1, name.downcase
      end
    end
  end

  def self.terms_for(prefix)
    $redis.zrevrange "search-suggestions:#{prefix.downcase}", 0, 9
  end
end