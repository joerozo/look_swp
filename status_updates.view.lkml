view: status_updates {
  sql_table_name: stage_nova.status_updates ;;

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

  dimension: former_state_id {
    type: number
    sql: ${TABLE}.former_state_id ;;
  }

  dimension: new_state_id {
    type: number
    sql: ${TABLE}.new_state_id ;;
  }

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
  }

  dimension: s3_pdf_path {
    type: string
    sql: ${TABLE}.s3_pdf_path ;;
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
    drill_fields: [id, proposals.id]
  }
}
