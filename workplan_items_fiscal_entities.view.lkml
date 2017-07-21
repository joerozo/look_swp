view: workplan_items_fiscal_entities {
  sql_table_name: stage_nova.workplan_items_fiscal_entities ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: fiscal_entity_id {
    type: number
    sql: ${TABLE}.fiscal_entity_id ;;
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
    drill_fields: [id, workplan_items.id]
  }
}
