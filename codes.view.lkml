view: codes {
  sql_table_name: stage_nova.codes ;;

  dimension: parent_code_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_code_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: program_top_codes {
    view_label: "Proposals Supply/Demand"
    type:  string
    sql: CASE WHEN ${type} = "top6_code" THEN ${value} ELSE null END;;
  }

  dimension: soc_codes {
    view_label: "Proposals Supply/Demand"
    type: string
    sql: CASE WHEN ${type} = "soc_code" THEN ${value} ELSE NULL END ;;
  }

  dimension: object_codes {
    view_label: "Budget Items"
    type: string
    sql: CASE WHEN ${type} = "object_code" THEN ${value} ELSE NULL END;;
  }

  measure: count {
    type: count
    drill_fields: [parent_code_id]
  }
}
