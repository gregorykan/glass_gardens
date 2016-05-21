module Gardening
  class Walker

    def initialize(garden)
      @garden = garden
      @authors = garden.authors
    end

    def walk
      markov_chain_generator.get_sentences(number_of_sentences).compact.join
    end

    def combined_authors_works
      Work.where(author: @authors).map(&:text).join(". ")
    end

    def number_of_sentences
      combined_authors_works.split(".").length
    end

    def markov_chain_generator
      MarkovChains::Generator.new(combined_authors_works)
    end

  end
end