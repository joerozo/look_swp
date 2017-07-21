view: funds {
  sql_table_name: stage_nova.funds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: fund_name {
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
  }

  filter: fund_filter {
    type: string
    suggest_dimension: fund_name
    suggest_explore: funds
  }

  set: fund_set {
    fields: [
      fund_name
    ]
  }

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
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       id,
#       name,
#       allocation_items.count,
#       budget_items.count,
#       contact_types.count,
#       fiscal_entities.count,
#       funds_users.count,
#       proposals.count,
#       states.count
#     ]
#   }

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

}
