include: "lmi_programs.view"
include: "funds.view"
view: proposals {
  sql_table_name: stage_nova.proposals ;;

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  measure: Count {
    type: count_distinct
    sql: ${id} ;;
  }

  dimension: all_sectors {
    type: yesno
    sql: ${TABLE}.all_sectors ;;
  }

  dimension: budget_state {
    type: string
    sql: ${TABLE}.budget_state ;;
    hidden: yes
  }

  dimension: contacts_state {
    type: string
    sql: ${TABLE}.contacts_state ;;
    hidden: yes
  }

  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_state {
    type: string
    sql: ${TABLE}.description_state ;;
    hidden: yes
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.end_date ;;
  }

  measure: lmi_program_count {
    type: count_distinct
    sql: ${lmi_programs.id} ;;
    hidden: yes
  }

# measure: cert {
#   type: sum
#   sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#   THEN ${estimated_cost}
#   ELSE 0
#   END;;
# }

  dimension: estimated_cost {
    type: number
    sql: ${TABLE}.estimated_cost ;;
  }

  dimension: fund_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.fund_id ;;
  }

  dimension: investments {
    type: string
    sql: ${TABLE}.investments ;;
  }

  dimension: lead_college_id {
    type: number
    sql: ${TABLE}.lead_college_id ;;
    hidden: yes
  }

  dimension: lead_district_id {
    type: number
    sql: ${TABLE}.lead_district_id ;;
    hidden: yes
  }

  dimension: lead_institution_id {
    type: number
    sql: ${TABLE}.lead_institution_id ;;
    hidden: yes
  }

  dimension: lmi_state {
    type: string
    sql: ${TABLE}.lmi_state ;;
    hidden: yes
  }

  dimension: local_share_plan_id {
    type: number
    sql: ${TABLE}.local_share_plan_id ;;
    hidden: yes
  }

  dimension: meets_swp_legis {
    type: yesno
    sql: ${TABLE}.meets_swp_legis ;;
    hidden: yes
  }

  dimension: metrics_state {
    type: string
    sql: ${TABLE}.metrics_state ;;
    hidden: yes
  }

  dimension: outcomes {
    type: string
    sql: ${TABLE}.outcomes ;;
    hidden: yes
  }

  dimension: preview_state {
    type: string
    sql: ${TABLE}.preview_state ;;
    hidden: yes
  }

  dimension: program_year_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.program_year_id ;;
    hidden: yes
  }

  dimension: rationale_1 {
    type: string
    sql: ${TABLE}.rationale_1 ;;
    hidden: yes
  }

  dimension: rationale_2 {
    type: string
    sql: ${TABLE}.rationale_2 ;;
    hidden: yes
  }

  dimension: rationale_3 {
    type: string
    sql: ${TABLE}.rationale_3 ;;
    hidden: yes
  }

  dimension: rationale_4 {
    type: string
    sql: ${TABLE}.rationale_4 ;;
    hidden: yes
  }

  dimension: read_swp_legis {
    type: yesno
    sql: ${TABLE}.read_swp_legis ;;
    hidden: yes
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.region_id ;;
    hidden: yes
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.start_date ;;
  }

  dimension: state_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.state_id ;;
    hidden: yes
  }

#   dimension_group: updated {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.updated_at ;;
#   }

  dimension: workplan_risks {
    type: string
    sql: ${TABLE}.workplan_risks ;;
  }

  dimension: workplan_state {
    type: string
    sql: ${TABLE}.workplan_state ;;
    hidden: yes
  }

  dimension: is_certified {
    type: yesno
    sql: ${TABLE}.state_id = 4 ;;
  }

  dimension:url {
    type: string
    sql: CONCAT("http://swpregional.cccco.edu/#/proposals/",${id},"/preview") ;;
  }

  measure: proposals_count_certified {
    type: count_distinct
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
          THEN ${proposals.id}
          ELSE NULL
          END;;
    filters: {
      field: is_certified
      value: "yes"
    }
    label: "Count Certified"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      states.id,
      states.name,
      regions.name,
      regions.parent_region_id,
      funds.id,
      funds.name,
      program_years.id,
      program_years.name,
      budget_items.count,
      emailqueue.count,
      lmis.count,
      metrics.count,
      proposals_contacts.count,
      proposals_counties.count,
      proposals_recommendations.count,
      proposals_sectors.count,
      proposals_subregions.count,
      status_updates.count,
      workplan_items.count
    ]
  }
}
