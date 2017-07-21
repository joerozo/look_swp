view: metrics {
  sql_table_name: stage_nova.metrics ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: baseline {
    type: number
    sql: ${TABLE}.baseline ;;
    hidden: yes
  }

  dimension: baseline_year_id {
    type: number
    sql: ${TABLE}.baseline_year_id ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: lmi_program_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.lmi_program_id ;;
    hidden: yes
  }

  dimension: metric_definition_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.metric_definition_id ;;
    hidden: yes
  }

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: year_1 {
    type: number
    sql: ${TABLE}.year_1 ;;
    hidden: yes
  }

  dimension: year_2 {
    type: number
    sql: ${TABLE}.year_2 ;;
    hidden: yes
  }

  dimension: year_3 {
    type: number
    sql: ${TABLE}.year_3 ;;
    hidden: yes
  }

  measure: enrollments_year_1 {
    type: sum
    sql: ${year_1} ;;
    filters: {
      field: metric_definition_id
      value: "1"
    }
  }

  measure: enrollments_year_2 {
    type: sum
    sql: ${year_2} ;;
    filters: {
      field: metric_definition_id
      value: "1"
    }
  }

  measure: enrollments_year_3 {
    type: sum
    sql: ${year_3} ;;
    filters: {
      field: metric_definition_id
      value: "1"
    }
  }
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       id,
#       metric_definitions.id,
#       metric_definitions.name,
#       proposals.id,
#       lmi_programs.id,
#       lmi_programs.name
#     ]
#   }
}
