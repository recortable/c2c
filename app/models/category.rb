class Category

  CATEGORIES = ['mail', 'news', 'post', 'document',  'htodo', 'event', 'proposal', 'hcal']
  TITLES = {'mail' => 'mensajes', 'news' => 'noticias', 'post' => 'entradas al blog',
    'document' => 'documentos', 'htodo' => 'tareas de la huerta', 'event' => 'convocatorias', 'proposal' => 'propuestas' ,
    'hcal' => 'calendario de la huerta'
    }
  COUNT = CATEGORIES.size

  MAGIC = CATEGORIES.each do |c|
    def c.contents
      Content.find(:all, :conditions => {:category => self}, :order => 'updated_at DESC')
    end

    def c.name
      TITLES[self]
    end
  end

  def self.title(name)
    TITLES[name]
  end


  def self.find(name)
    return CATEGORIES if name == :all
    name = name.to_s
    i = CATEGORIES.index(name)
    CATEGORIES[i] if i
  end
end
