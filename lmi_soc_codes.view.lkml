view: lmi_soc_codes {
  sql_table_name: stage_nova.lmi_soc_codes ;;

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

  dimension: demand {
    type: number
    sql: ${TABLE}.demand ;;
  }

  dimension: lmi_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.lmi_id ;;
  }

  dimension: soc_code {
    type: string
    sql: ${TABLE}.soc_code ;;
  }

  dimension: soc_code_id {
    type: number
    sql: ${TABLE}.soc_code_id ;;
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
    drill_fields: [id, lmis.id, lmis.name]
  }
}
