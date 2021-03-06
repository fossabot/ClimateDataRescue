require 'field_option'

class CreateDefaultFieldOptions < ActiveRecord::Migration
  def up
    FieldOption.reset_column_information

    FieldOption.create!(
      {
        name: 'Empty / Blank',
        value: 'empty',
        display_attribute: 'name',
        is_default: true
      }
    )
    FieldOption.create!(
      {
        name: 'Illegible',
        value: 'illegible',
        display_attribute: 'name',
        is_default: true
      }
    )
    FieldOption.create!(
      {
        name: 'Retracted / Line through',
        value: 'retracted',
        display_attribute: 'name',
        is_default: true
      }
    )
  end

  def down
    FieldOption.reset_column_information
    
    FieldOption.where(is_default: true).destroy_all
  end
end
