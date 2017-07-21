view: lmi_programs {
  sql_table_name: stage_nova.lmi_programs ;;

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

  dimension: fiscal_entity_id {
    type: number
    sql: ${TABLE}.fiscal_entity_id ;;
  }

  dimension: lmi_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.lmi_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: narrative {
    type: string
    sql: ${TABLE}.narrative ;;
  }

  dimension: soc_code {
    type: number
    sql: ${TABLE}.soc_code ;;
  }

  dimension: supply {
    type: number
    sql: ${TABLE}.supply ;;
  }

  dimension: top6_code_id {
    type: number
    sql: ${TABLE}.top6_code_id ;;
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

  measure: lmi_program_budget {
    type: sum
    sql: ${proposals.budget_per_lmi_program} ;;
    label: "TOP Code Budget"
    sql_distinct_key: CONCAT(${lmi_programs.id},' ',${proposals.id}) ;;
    value_format_name: "usd_0"
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      lmis.id,
      lmis.name,
      colleges.id,
      colleges.name,
      metrics.count
    ]
  }
}
