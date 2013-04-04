module Codebreaker
  class Marker

    def initialize(secret, guess)
      @secret = secret
      @guess = guess
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    def total_match_count
      matches = 0
      secret = @secret.split('')
      @guess.split('').each do |character|
        if secret.include?(character)
          matches += delete_first(secret, character) ? 1 : 0
        end
      end
      matches
    end

    def delete_first(array, character)
      # delete_at returns null if nothing was deleted
      array.delete_at array.index(character) if array.include? character
    end

    def exact_match_count
      (0..3).inject(0) do |count, index|
        count += (exact_match?(@guess, index) ? 1 : 0)
      end
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end

  end
end