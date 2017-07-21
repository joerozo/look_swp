view: proposals_recommendations {
  sql_table_name: stage_nova.proposals_recommendations ;;

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

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
  }

  dimension: recommendation_code {
    type: number
    sql: ${TABLE}.recommendation_code ;;
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
