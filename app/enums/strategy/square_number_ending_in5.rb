class Strategy::SquareNumberEndingIn5 < Strategy
  def name
    'Square a Number Ending in 5'
  end

  def hint
    'Multiply first part by its increment, then write 25.'
  end

  UPPER_LIMIT = 115

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication
      a = question.left.to_i
      b = question.right.to_i
      if  a == b and
          a % 10 == 5 and
          a <= UPPER_LIMIT
        return true
      end
    elsif question.is_a? Question::Exponential
      exponent = question.exponent.to_i
      base = question.base.to_i
      if  exponent == 2 and
          base % 10 == 5 and
          base <= UPPER_LIMIT
        return true
      end
    end
    false
  end

  # @override
  def possible_questions
    Question.where('type=? or type=?', Question::Multiplication, Question::Exponential)
  end

end