class Question::Binary < Question

  #############
  class << self
    # override this
    def self.new_expression(left, right)
    end

    #@return new question
    def self.build(left_leaf, right_leaf)

      # new question
      x = self.new

      # generate the left and right nodes
      left = Expression.new_from_value left_leaf
      right = Expression.new_from_value right_leaf

      # assign a new expression to question
      x.expression = self.new_expression left, right

      # return new question
      x
    end
  end

end