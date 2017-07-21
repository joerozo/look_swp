view: tasks {
  sql_table_name: stage_nova.tasks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cfad_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.cfad_id ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}.completed ;;
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

  dimension: task_type {
    type: string
    sql: ${TABLE}.task_type ;;
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

  measure: count {
    type: count
    drill_fields: [id, cfads.id, notifications.count]
  }
}
