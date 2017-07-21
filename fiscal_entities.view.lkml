view: fiscal_entities {
  sql_table_name: stage_nova.fiscal_entities ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
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

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
    hidden: yes
  }

  dimension: fiscal_entity_role_id {
    type: number
    hidden: yes
    sql: ${TABLE}.fiscal_entity_role_id ;;
    hidden: yes
  }

  dimension: fund_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.fund_id ;;
    hidden: yes
  }

  dimension: fund_year_id {
    type: number
    sql: ${TABLE}.fund_year_id ;;
    hidden: yes
  }

  dimension: institution_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.institution_id ;;
    hidden: yes
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
#       funds.id,
#       funds.name,
#       institutions.id,
#       institutions.name,
#       institutions.shortname,
#       fiscal_entity_roles.id,
#       fiscal_entity_roles.name,
#       fiscal_entity_roles.shortname
#     ]
#   }
}
