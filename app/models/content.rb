class Content < ActiveRecord::Base
  belongs_to :page
  enum target: [ :h1, :h2, :h3, :a ]

  def as_json(options = nil)
    super(:only => [:target, :occurrence])
  end
end
