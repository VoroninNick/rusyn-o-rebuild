# coding: utf-8

class Catalog::Category < ActiveRecord::Base
  attr_accessible  :parent_category_id, :description, :child_category_ids, :category_url, :display_index
  attr_accessible :name
  has_many :child_categories, class_name: "Category",
                          foreign_key: "parent_category_id"

  #accepts_nested_attributes_for :child_categories#, :allow_destroy => true
  #attr_accessible :child_categories_attributes#, :allow_destroy => true
 
  belongs_to :parent_category, class_name: "Category"

  has_many :category_items

  # accepts_nested_attributes_for :category_items#, :allow_destroy => true
  # attr_accessible :category_items_attributes#, :allow_destroy => true
  attr_accessible :category_item_ids


   #images collection
   has_many :category_images

   accepts_nested_attributes_for :category_images#, :allow_destroy => true
   attr_accessible :category_images_attributes#, :allow_destroy => true




   validates :name, :uniqueness => true, presence: true
   before_validation :generate_category_url

  has_one :object_metadata
  attr_accessible :object_metadata

  accepts_nested_attributes_for :object_metadata
  attr_accessible :object_metadata_attributes

   def generate_category_url
    #self.category_url ||= self.name.parameterize

    if !object_metadata
      #object_metadata = ObjectMetadata.create!(article_id: (Article.last.id + 1) )
      build_object_metadata
    end

    object_metadata.url ||= name.parameterize
    object_metadata.head_title ||= name
    object_metadata.body_title ||= name

    #self.article_url = object_metadata.url
    category_url = object_metadata.url
  end

  def  to_param
    :display_index
  end


  #rails_admin do
  ## label 'Картинка'
  # # label_plural 'Картинки'
  #
  ##  list do
  ##    field :name
  ##    field :album
  ##    field :image
  ##  end
  #
  #  edit do
  #    field :name
  #    field :parent_category
  #    field :child_categories
  #    field :display_index
  #    field :category_items
  #    field :category_images
  #  end
  #end

  rails_admin do
    label 'Категория'
    label_plural 'Категории'

    edit do
      field :parent_category do
        label 'Родительская категория (если есть)'
      end
      field :name do
        label 'Название'
      end
      field :description, :ck_editor do
        label 'Описание'
      end
      field :category_images do
        label 'Картинки для категории'
      end
      field :category_items do
        label 'Продукты'
      end
      field :child_categories do
        label 'Дочерние категории'
      end

      field :object_metadata
    end

    list do
      field :parent_category do
        label 'Родительская категория (если есть)'
      end
      field :name do
        label 'Название'
      end
      field :description do
        label 'Описание'
      end
      field :category_images do
        label 'Картинки для категории'
      end
      field :category_items do
        label 'Продукты'
      end
      field :child_categories do
        label 'Дочерние категории'
      end
    end
  end
end
