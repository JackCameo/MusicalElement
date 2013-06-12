ThinkingSphinx::Index.define :track, :with => :active_record do

  indexes title, :sortable => true
  indexes content
  indexes name

  has artist_id, created_at, updated_at


end
