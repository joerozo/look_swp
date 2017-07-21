view: cfads {
  sql_table_name: stage_nova.cfads ;;

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

  dimension: direct_funding {
    type: yesno
    sql: ${TABLE}.direct_funding ;;
  }

  dimension: fiscal_approach {
    type: string
    sql: ${TABLE}.fiscal_approach ;;
  }

  dimension: fiscal_entity_id {
    type: number
    sql: ${TABLE}.fiscal_entity_id ;;
  }

  dimension: rationale {
    type: string
    sql: ${TABLE}.rationale ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
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
    drill_fields: [id, tasks.count]
  }
}
