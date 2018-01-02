class AddNewFirstLevelTags < ActiveRecord::Migration[5.0]
  def change
    {
      "农业产品食品" => "农业产品食品（植物类、畜牧类、渔业类、微生物类等初级农产品）安全及风险评估：来源于农业的可食用产品、非食用产品和初级加工品的安全及损害评估。",
      "非农业产品" => "非农业产品安全及风险评估：经过加工并改变其理化性质的食品的安全及损害评估。",
      "食品产地环境" => "品产地环境安全及风险评估：土壤背景、外源污染、用水质量、空气质量等环境因素的安全及损害评估。",
      "投入品" => "投入品安全及风险评估：化肥、农药、兽药、渔药、饲料及饲料添加剂、生长促进剂、激素、消毒剂等投入品的安全及损害评估。",
      "食品添加剂" => "食品添加剂、包装材料、运输工具、食品标签等安全及风险评估。"
    }.each_pair do |name, description|
      FirstLevelTag.create name: name, description: description
    end
  end
end
