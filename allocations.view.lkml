include: "funds.view"
view: allocations {
  sql_table_name: stage_nova.allocations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: from_entity_id {
    type: number
    sql: ${TABLE}.from_entity_id ;;
    hidden: yes
  }

  dimension: to_entity_id {
    type: number
    sql: ${TABLE}.to_entity_id ;;
}

#   dimension_group: created {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.created_at ;;
#   }

#   dimension_group: updated {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.updated_at ;;
#   }

}
