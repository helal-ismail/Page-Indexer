class Page < ActiveRecord::Base
  has_many :contents, dependent: :destroy

  def as_json(options = nil)
    result = {:link => self.link,:timestamp => self.updated_at, :contents => self.contents}
    result
  end
end
