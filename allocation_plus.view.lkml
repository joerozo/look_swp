view: allocation_plus {
  derived_table: {
    sql: select allocations.id, ri.name as name, ri.id as institution_id, s.fund_year_id as program_year_id, s.fund_id as fund_id, sfe.name as source, allocations.amount, funds.name as fund_name from allocations
      left join fiscal_entities as s on allocations.from_entity_id = s.id
      left join fiscal_entities as r on allocations.to_entity_id = r.id
      left join fiscal_entity_roles as sfe on s.fiscal_entity_role_id = sfe.id
      left join institutions as ri on r.institution_id = ri.id
      left join funds as funds on s.fund_id = funds.id
      order by allocations.amount desc
 ;;
  }

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

  dimension: fund_id {
    type: number
    sql: ${TABLE}.fund_id ;;
    hidden: yes
  }

  dimension: super_allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "state" ;;
    hidden: yes
  }

  measure: allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "no"
    }
    value_format_name: "usd_0"
  }

  measure: super_allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "yes"
    }
    value_format_name: "usd_0"
  }


  dimension: institution_id {
    type: number
    sql: ${TABLE}.institution_id ;;
    hidden: yes

  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: program_year_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.program_year_id ;;
    hidden: yes
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    hidden: yes
  }

  dimension: fund_name {
    hidden: yes
    type: string
    sql: ${TABLE}.fund_name ;;
  }
}
