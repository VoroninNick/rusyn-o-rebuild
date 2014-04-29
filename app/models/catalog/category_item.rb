# coding: utf-8

class Catalog::CategoryItem < ActiveRecord::Base
  attr_accessible :quantity, :size, :weight, :name, :category_id

  has_and_belongs_to_many :item_colors
  attr_accessible :item_colors#, :item_color_ids

  belongs_to :category, :inverse_of => :category_items


   #images collection
   has_many :category_item_images

   accepts_nested_attributes_for :category_item_images#, :allow_destroy => true
   attr_accessible :category_item_images_attributes#, :allow_destroy => true


   # colors references

   #has_and_belongs_to_many :catalog_category_item_colors
   #attr_accessible :catalog_category_item_colors, :catalog_category_item_color_ids

   #accepts_nested_attributes_for :category_item_colors#, :allow_destroy => true
   #attr_accessible :category_item_colors_attributes#, :allow_destroy => true

   def getSizeAsArray
     rows = self.size.strip.split("\r\n")
     @result = []
     rows.each do |row|
      @result <<  row.split('x')
     end

     return @result 
   end

  rails_admin do
    label 'Продукт'
    label_plural 'Продукты'

    list do
      field :category do
        label 'Категория'
      end
      field :name do
        label 'Название продукта'
      end
      field :size do
        label 'Размеры'
      end
      field :quantity do
        label 'Колличество:'
      end
      field :weight do
        label 'Вес'
      end

      field :category_item_images do
        label 'картинки для продукта'
      end
      #field :category_item_colors do
      #  label 'цвета для продукта'
      #end
    end

    edit do
      field :category do
        label 'Категория'
      end
      field :name do
        label 'Название продукта'
      end
      field :size do
        label 'Размеры'
      end
      field :quantity do
        label 'Колличество: примеры:10.8 ( м2 на поддоне ); 1 ( = поштучно )'
      end
      field :weight do
        label 'Вес'
      end

      field :category_item_images do
        label 'картинки для продукта'
      end
      #field :category_item_colors do
      #  label 'цвета для продукта'
      #end
    end
  end
end
