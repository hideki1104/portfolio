json.array!(@training_management) do |training|
	json.title "#{training[:training_name] + training[:number_time].to_s + "回" + "×" + training[:set_count].to_s + "セット"}"
	json.start training[:created_at]
end