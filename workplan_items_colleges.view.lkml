view: workplan_items_colleges {
  sql_table_name: stage_nova.workplan_items_colleges ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: college_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.college_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: workplan_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workplan_item_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, workplan_items.id, colleges.id, colleges.name]
  }
}
