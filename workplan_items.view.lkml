view: workplan_items {
  sql_table_name: stage_nova.workplan_items ;;

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

  dimension: lead_institution {
    type: string
    sql: ${TABLE}.lead_institution ;;
  }

  dimension: major_activities {
    type: string
    sql: ${TABLE}.major_activities ;;
  }

  dimension: major_outcomes {
    type: string
    sql: ${TABLE}.major_outcomes ;;
  }

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
  }

  dimension: responsible_college_id {
    type: number
    sql: ${TABLE}.responsible_college_id ;;
  }

  dimension: responsible_person {
    type: string
    sql: ${TABLE}.responsible_person ;;
  }

  dimension: responsible_person_id {
    type: number
    sql: ${TABLE}.responsible_person_id ;;
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

  dimension: year_1 {
    type: yesno
    sql: ${TABLE}.year_1 ;;
  }

  dimension: year_2 {
    type: yesno
    sql: ${TABLE}.year_2 ;;
  }

  dimension: year_3 {
    type: yesno
    sql: ${TABLE}.year_3 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, proposals.id, workplan_items_colleges.count, workplan_items_fiscal_entities.count]
  }
}
