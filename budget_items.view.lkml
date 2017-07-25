include: "funds.view"
include: "proposals.view"
view: budget_items {
  sql_table_name: stage_nova.budget_items ;;




  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    hidden: yes
  }

  dimension: contact_user_id {
    type: string
    sql: ${TABLE}.contact_user_id ;;
    hidden: yes
  }

  dimension: district_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.district_id ;;
    hidden: yes
  }

  dimension: fiscal_entity_id {
    type: number
    sql: ${TABLE}.fiscal_entity_id ;;
    hidden: yes
  }

  dimension: proposal_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposal_id ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: object_codes {
    type: number
    sql: ${TABLE}.object_code ;;
    hidden: yes
  }

  measure: certified_budget {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
        THEN ${amount}
        ELSE 0
        END;;
    filters: {
      field: proposals.is_certified
      value: "yes"
    }
    value_format_name: "usd_0"
  }

  measure: total_budget {
    label: "Budget"
    type: sum
    sql: ${amount} ;;
    value_format_name: "usd_0"
  }

#   measure: college_count {
#     type: count_distinct
#     sql: ${college_id} ;;
#   }
#   dimension: college_id {
#     type: number
#     sql: ${TABLE}.college_id ;;
#     hidden: yes
#   }
#
#   dimension: fund_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.fund_id ;;
#     hidden: yes
#   }
#   dimension_group: created {
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
#     sql: ${TABLE}.created_at ;;
#   }

#   measure: y1_total {
#     label: "Year 1 Total Budget"
#     type: sum
#     sql: ${year_1} ;;
#     value_format_name: "usd_0"
#   }
#
#   measure: y2_total {
#     label: "Year 2 Total Budget"
#     type: sum
#     sql: ${year_2} ;;
#     value_format_name: "usd_0"
#   }
#
#   measure: y3_total {
#     label: "Year 3 Total Budget"
#     type: sum
#     sql: ${year_3} ;;
#     value_format_name: "usd_0"
#   }

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

#   dimension: year_1 {
#     type: number
#     sql: ${TABLE}.year_1 ;;
#     value_format_name: "usd_0"
#     hidden: yes
#   }
#
#   dimension: year_2 {
#     type: number
#     sql: ${TABLE}.year_2 ;;
#     value_format_name: "usd_0"
#     hidden: yes
#   }
#
#   dimension: year_3 {
#     type: number
#     sql: ${TABLE}.year_3 ;;
#     value_format_name: "usd_0"
#     hidden: yes
#   }
#
#   measure: ty1 {
#     type: sum
#     sql: ${year_1} ;;
#     hidden: yes
#   }
#
#   measure: ty2 {
#     type: sum
#     sql: ${year_2} ;;
#     hidden: yes
#   }
#
#   measure: ty3 {
#     type: sum
#     sql: ${year_3} ;;
#     hidden: yes
#   }
  # *********************************************************************

#   measure: total_year_1 {
#     label: "Year 1 Total Budget"
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#         THEN ${year_1}
#         ELSE 0
#         END;;
#     value_format_name: "usd_0"
#     label: "Year 1"
#   }
#
#   measure: total_year_2 {
#     label: "Year 2 Total Budget"
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#           THEN ${year_2}
#           ELSE 0
#           END;;
#     value_format_name: "usd_0"
#     label: "Year 2"
#   }
#
#   measure: total_year_3 {
#     label: "Year 3 Total Budget"
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#           THEN ${year_3}
#           ELSE 0
#           END;;
#     value_format_name: "usd_0"
#     label: "Year 3"
#   }


#   dimension: budget_per_lmi_program {
#     type: number
#     sql: ${total_budget}/${proposals.lmi_program_count};;
#     hidden: yes
#   }
#
#   measure: lmi_program_budget {
#     view_label: "Proposals Supply/Demand"
#     type: sum
#     sql: ${budget_per_lmi_program} ;;
#     label: "TOP Code Budget"
#     sql_distinct_key: CONCAT(${lmi_programs.id},' ',${proposals.id}) ;;
#     value_format_name: "usd_0"
#   }

#
#   measure: total_year_1_certified {
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#       THEN ${year_1}
#       ELSE 0
#       END;;
#     filters: {
#       field: proposals.is_certified
#       value: "yes"
#     }
#     value_format_name: "usd_0"
#     hidden: yes
#   }
#
#   measure: total_year_2_certified {
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#         THEN ${year_2}
#         ELSE 0
#         END;;
#     filters: {
#       field: proposals.is_certified
#       value: "yes"
#     }
#     value_format_name: "usd_0"
#     hidden: yes
#   }
#
#   measure: total_year_3_certified {
#     type: sum
#     sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#         THEN ${year_3}
#         ELSE 0
#         END;;
#     filters: {
#       field: proposals.is_certified
#       value: "yes"
#     }
#     value_format_name: "usd_0"
#     hidden: yes
#   }

#   measure: certified_budget {
#     type: number
#     sql: ${total_year_1_certified} + ${total_year_2_certified} + ${total_year_3_certified} ;;
#     value_format_name: "usd_0"
#   }

#   measure: total_budget {
#     label: "Budget"
#     type: number
#     sql: ${total_year_1} + ${total_year_2} + ${total_year_3} ;;
#     value_format_name: "usd_0"
#   }
#
}
