view: regions {
  sql_table_name: stage_nova.regions ;;

  dimension: parent_region_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_region_id ;;
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

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: name {
    label: "Region"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: region_name {
    label: "Region"
    group_label: "Creator"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       parent_region_id,
#       name,
#       districts.count,
#       lmis.count,
#       lmis_subregions.count,
#       proposals.count,
#       proposals_subregions.count,
#       regions_users.count,
#       signing_authorities.count
#     ]
#   }
}
