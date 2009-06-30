class Content < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :group
  has_and_belongs_to_many :labels
  has_many :comments, :dependent => :delete_all, :order => 'id DESC'
  before_create {|c| c.comments_count = 0}
  has_attached_file :clip,
    :url => '/assets/archivos/:id/:style/:basename.:extension',
    :path => ':rails_root/public/assets/archivos/:id/:style/:basename.:extension'

  validates_presence_of :title

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def has_label?(label)
    labels.include?(label)
  end

  def toggle_label(label, user)
    if has_label? label
      labels.delete label
      return false
    else
      labels << label
      return true
    end
  end

  def add_comment(params)
    cmt = self.comments.create(params)
    if !cmt.body.blank?
      Content.transaction do
        cmt.save!
        self.comments_count += 1
        save!
      end
    end
  end

  def delivered?
    !delivered_at.nil?
  end

  def delivered_uptodate?
    delivered? && delivered_at > updated_at
  end

  def editable_by?(user)
    !user.nil? && user.groups.include?(group)
  end



end
