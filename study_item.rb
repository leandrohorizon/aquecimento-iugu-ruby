class StudyItem
  attr_reader :title, :category;
  def initialize(title, category)
    @title = title
    @category = category
  end

  # def title
  #   @title
  # end

  # def title=(title) pode definir como StudyItem.title = titulo
  #   @title = title
  # end
end