module AdminItemsHelper
  def genre_arrays(genre_model)
    arrays = []
    genre_model.each do |genre|
      genre_array = []
      genre_array.push(genre['genre_name'])
      genre_array.push(genre['id'])
      arrays.push(genre_array)
    end
    arrays
  end

  def label_arrays(label_model)
    arrays = []
    label_model.each do |label|
      label_array = []
      label_array.push(label['label_name'])
      label_array.push(label['id'])
      arrays.push(label_array)
    end
    arrays
  end
end
