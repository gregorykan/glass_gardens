module Gardening
  class Walker

    def initialize(garden)
      @garden = garden
      @authors = garden.authors
    end

    def walk
      markov_chain_generator.get_sentences(number_of_sentences).reject { |x| x.to_s.empty? }.join
    end

    def combined_authors_works
      Work.where(author: @authors).map(&:text).reject { |x| x.to_s.empty? }.join(". ")
    end

    def number_of_sentences
      combined_authors_works.split(".").reject { |x| x.to_s.empty? }.length
    end

    def markov_chain_generator
      MarkovChains::Generator.new(combined_authors_works)
    end

  end
end