class SearchSuggestion
  def self.seed
    Search.find_each do |s|
      location = s.location
      1.upto(location.length - 1) do |n|
        prefix = location[0, n]
        $redis.zadd "search-suggestions:#{prefix.downcase}", 1, location.downcase
      end
    end
    end

  def self.terms_for(prefix)
    $redis.zrevrange "search-suggestions:#{prefix.downcase}", 0, 9
  end
end