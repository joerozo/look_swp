view: allocation_items {
  derived_table: {
    sql: select ri.name as name, ri.id as institution_id, s.fund_year_id as program_year_id, s.fund_id as fund_id, sfe.name as source, allocations.amount from allocations
      left join fiscal_entities as s on allocations.from_entity_id = s.id
      left join fiscal_entities as r on allocations.to_entity_id = r.id
      left join fiscal_entity_roles as sfe on s.fiscal_entity_role_id = sfe.id
      left join institutions as ri on r.institution_id = ri.id
      order by allocations.amount desc
       ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: institution_id {
    type: number
    sql: ${TABLE}.institution_id ;;
  }

  dimension: program_year_id {
    type: number
    sql: ${TABLE}.program_year_id ;;
  }

  dimension: fund_id {
    type: number
    sql: ${TABLE}.fund_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: super_allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "state" ;;
    hidden: yes
  }

  dimension: allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "region" ;;
    hidden: yes
  }

  measure: allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END, 0);;
    filters: {
      field: super_allocation_bool
      value: "no"
    }
    value_format_name: "usd_0"
  }

  measure: super_allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "yes"
    }
    value_format_name: "usd_0"
  }
}
