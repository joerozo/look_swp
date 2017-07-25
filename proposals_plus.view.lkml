view: proposals_plus {
  derived_table: {
    sql: SELECT
        proposals.*
        ,funds.name AS `fund_name`
        ,(COUNT(DISTINCT proposals_sectors.id)) as `sector_count`
        ,budget_items.year_1 as `budget_year_1`
        ,budget_items.year_2 as `budget_year_2`
        ,budget_items.year_3 as `budget_year_3`
        ,(COUNT(DISTINCT lmi_programs.id)) as `lmi_program_count`
      FROM regions  AS regions
      LEFT JOIN districts  AS districts ON regions.id = districts.region_id
      LEFT JOIN institutions  AS institutions ON districts.id = institutions.district_id
      LEFT JOIN (
        select
          id
          ,college_id
          ,proposal_id
          ,COALESCE(SUM(year_1),0) as year_1
          ,COALESCE(SUM(year_2),0) as year_2
          ,COALESCE(SUM(year_3),0) as year_3
        from budget_items
        group by proposal_id
      ) AS budget_items ON institutions.id = budget_items.college_id
      LEFT JOIN proposals  AS proposals ON budget_items.proposal_id = proposals.id
      LEFT JOIN funds AS funds ON proposals.fund_id = funds.id
      LEFT JOIN proposals_sectors as proposals_sectors on proposals_sectors.proposal_id = proposals.id
      LEFT JOIN lmis as lmis on lmis.proposal_id = proposals.id
      LEFT JOIN lmi_programs on lmi_programs.lmi_id = lmis.id


      WHERE
        ((proposals.title IS NOT NULL))
      GROUP BY 1,2
 ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#     hidden: yes
#   }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: all_sectors {
    type: yesno
    sql: ${TABLE}.all_sectors ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
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

  dimension:fund_id {
    type: number
    sql: ${TABLE}.fund_id ;;
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
    hidden: no
  }

  dimension: estimated_cost {
    type: number
    sql: ${TABLE}.estimated_cost ;;
  }

  dimension: investments {
    type: string
    sql: ${TABLE}.investments ;;
  }

  dimension: lead_institution_id {
    type: number
    sql: ${TABLE}.lead_institution_id ;;
    hidden: yes
  }

  dimension: lead_district_id {
    type: number
    sql: ${TABLE}.lead_district_id ;;
    hidden: yes
  }

  dimension: meets_swp_legis {
    type: yesno
    sql: ${TABLE}.meets_swp_legis ;;
    hidden: yes
  }

  dimension: outcomes {
    type: string
    sql: ${TABLE}.outcomes ;;
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
    hidden: no
  }

#   dimension: title {
#     type: string
#     sql: ${TABLE}.title ;;
#     link: {
#       label: "View Proposal"
#       url: "{% if proposals.local_share_plan_id._value != null %}http://public.ewdgrants.net/plans/summary/{{ proposals.local_share_plan_id._value }}{% else %}http://swpregional.cccco.edu/#/download?id={{ proposals.id._value }}{% endif %}"
#       icon_url: "http://swpregional.cccco.edu/assets/images/favicon-16x16.png"
#     }
#     required_fields: [proposals.id]
#   }

#   dimension: title {
#     type: string
#     sql: ${TABLE}.title ;;
#     link: {
#       label: "View Proposal"
#       url: "{% if proposals.local_share_plan_id._value != null %}http://public.ewdgrants.net/plans/summary/{{ proposals.local_share_plan_id._value }}{% else %}http://swpregional.cccco.edu/#/download?id={{ proposals.id._value }}{% endif %}"
#       icon_url: "http://swpregional.cccco.edu/assets/images/favicon-16x16.png"
#     }
#     required_fields: [proposals.id]
#   }

  #looker support added this dimension
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    link: {
      label: "View Proposal"
      url: "{% if proposals.local_share_plan_id._value != null %}http://public.ewdgrants.net/plans/summary/{{ proposals.local_share_plan_id._value }}{% else %}http://swpregional.cccco.edu/#/download?id={{ proposals.id._value }}{% endif %}"
      icon_url: "http://swpregional.cccco.edu/assets/images/favicon-16x16.png"
    }
    required_fields: [proposals.id]
  }

  dimension:url {
    type: string
    sql: CONCAT("http://swpregional.cccco.edu/#/proposals/",${id},"/preview") ;;
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

  dimension: workplan_risks {
    type: string
    sql: ${TABLE}.workplan_risks ;;
    hidden: no
  }

  dimension: is_certified {
    type: yesno
    sql: ${TABLE}.state_id = 4 ;;
  }

  dimension: local_share_plan_id {
    type: number
    sql: ${TABLE}.local_share_plan_id ;;
    hidden: yes
  }

  dimension: fund_name {
    type: string
    hidden: yes
    sql: ${TABLE}.fund_name ;;
  }

  dimension: budget_year_1 {
    type: number
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
        THEN ${TABLE}.budget_year_1
        ELSE 0
        END;;
    hidden: yes
  }

  dimension: budget_year_2 {
    type: number
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
      THEN ${TABLE}.budget_year_2
      ELSE 0
      END;;
    hidden: yes
  }

  dimension: budget_year_3 {
    type: number
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
      THEN ${TABLE}.budget_year_3
      ELSE 0
      END;;
    hidden: yes
  }

  dimension: total_budget {
    type: number
    sql: ${budget_year_1} + ${budget_year_2} + ${budget_year_3} ;;
    hidden: yes
  }

  dimension: sector_count {
    type: number
    sql: CASE WHEN ${all_sectors}
      THEN 1
      ELSE ${TABLE}.sector_count
      END ;;
    hidden: yes
  }

  dimension: budget_per_sector {
    type: number
    sql: ${total_budget}/${sector_count} ;;
    hidden: yes
  }

  dimension: lmi_program_count {
    type: number
    sql: ${TABLE}.lmi_program_count ;;
    hidden:  yes
  }

  dimension: budget_per_lmi_program {
    type: number
    sql: ${total_budget}/${lmi_program_count} ;;
    hidden: yes
  }

  measure: proposals_count {
    type: count_distinct
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
          THEN ${proposals.id}
          ELSE NULL
          END;;
    label: "Count"
  }

  measure: proposals_count_certified {
    type: count_distinct
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
          THEN ${proposals.id}
          ELSE NULL
          END;;
    filters: {
      field: is_certified
      value: "yes"
    }
    label: "Count Certified"
  }
}
