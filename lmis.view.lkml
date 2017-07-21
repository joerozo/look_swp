view: lmis {
  sql_table_name: stage_nova.lmis ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
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

  dimension: has_occupational_projections {
    type: yesno
    sql: ${TABLE}.has_occupational_projections ;;
  }

  dimension: lmi_template_id {
    type: number
    sql: ${TABLE}.lmi_template_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Occupational Cluster"
  }

  dimension: other_supply {
    type: number
    sql: ${TABLE}.other_supply ;;
  }

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.region_id ;;
  }

  dimension: soc_code_id {
    type: number
    sql: ${TABLE}.soc_code_id ;;
  }

  dimension: subregion {
    type: string
    sql: ${TABLE}.subregion ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      proposals.id,
      regions.name,
      regions.parent_region_id,
      lmis_counties.count,
      lmis_subregions.count,
      lmi_evidences.count,
      lmi_programs.count,
      lmi_soc_codes.count
    ]
  }
}
