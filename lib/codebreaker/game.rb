module Codebreaker
  class Game
    attr_reader :code

    def initialize
      @code = Array.new(4) { rand(1..6) }.join
    end

    def submit_guess(guess)
      guess, code = guess.chars.zip(@code.chars)
        .select { |e| e[0] != e[1] }.transpose
      result = '' << '+' * (4 - code.length)
      result << '-' * guess.product(code.map.with_index { |e, i| [i, e] })
        .select { |e| e[0] == e[1][1] }.uniq { |e| [e[1][0], e[1][1]] }.length
    end

    def hint
      @hint ||= @code.chars.sample
    end
  end
end
