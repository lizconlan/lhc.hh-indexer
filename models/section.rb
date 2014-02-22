class Section < ActiveRecord::Base
  belongs_to :sitting
  has_many :contributions
  
  def hansard_ref
    cols = ""
    if start_column == end_column or end_column.nil?
      cols = "c#{start_column}"
    else
      significant_digits = column_significant_digits(start_column.to_i, end_column.to_i)
      if start_column =~ /\d+(.*)$/
        suffix = $1
      else
        suffix = ""
      end
      cols = "cc#{start_column.gsub(suffix, '')}-#{significant_digits}#{suffix}"
    end
    "H#{sitting.house[0..0]} Deb #{date.strftime("%e %b %Y")} vol #{sitting.volume.number_string} #{cols}".squeeze(" ")
  end
  
  
  private
  
  def column_significant_digits(start_number, end_number)
    start_text = start_number.to_s
    end_text = end_number.to_s
    if end_text.size > start_text.size
      significant_digits = end_text
    else
      start_part = start_text
      end_part = end_text
      while start_part && end_part && start_part[0] == end_part[0]
        start_part = start_part[1, (start_part.size - 1)]
        end_part = end_part[1, (end_part.size - 1)]
      end
      significant_digits = end_part
    end
    significant_digits
  end
end

class Debates < Section
end

class OralQuestions < Section
end

class OralQuestionsSection < Section
end

class OralQuestionSection < Section
end

class WrittenAnswersBody < Section
end

class WrittenAnswersGroup < Section
end

class WrittenStatementsBody < Section
end

class WrittenStatementsGroup < Section
end