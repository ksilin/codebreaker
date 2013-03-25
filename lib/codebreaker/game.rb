module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      if exact_match?(guess)
        mark = '+'
      elsif number_match(guess)
        mark = '-'
      else
        mark = ''
      end
      @output.puts mark
    end

    def number_match(guess)
      @secret.include?(guess[0])
    end

    def exact_match?(guess)
      @secret[0] == guess[0]
    end

  end
end
