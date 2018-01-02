class RemovePreviousFirstLevelTags < ActiveRecord::Migration[5.0]
  def change
    FirstLevelTag.where(name: ["农业", "知识产权", "科技事务", "计算机", "声像资料", "微量物证"]).destroy_all
    FirstLevelTag.create(name: "微量物证", description: "其他微量物证司法鉴定。")
  end
end